use std::collections::HashMap;

use boa_engine::{JsString, Source, js_string};
use regex::Regex;
use xmloxide::{
    Document, NodeId, css,
    html5::parse_html5,
    xpath::{self, XPathNode, XPathValue},
};

use crate::errors::{ELEMENT_NOT_FOUND, HtmlParseResult, INTERNAL_ERROR, PARSER_ERROR, ParseError};
use crate::models::selector::{
    ParserConfig, SelectorFunctionType, SelectorQueryType, SelectorRule, SelectorScript,
};

enum SelectResult {
    Dom(NodeId),
    Text(String),
}

enum SelectOutcome {
    Hit(SelectResult),
    Miss,
    Failed,
}

fn is_placeholder(rule: &SelectorRule) -> bool {
    rule.selector.trim().is_empty()
        && !matches!(rule.query_type, SelectorQueryType::This)
        && matches!(rule.function, SelectorFunctionType::Text)
        && rule.parameter.is_empty()
        && rule.regex.is_empty()
        && rule.default_value.is_empty()
}

fn select(
    doc: &Document,
    root: NodeId,
    rule: &SelectorRule,
    errors: &mut Vec<ParseError>,
) -> SelectOutcome {
    if rule.selector.trim().is_empty() || matches!(rule.query_type, SelectorQueryType::This) {
        return SelectOutcome::Hit(SelectResult::Dom(root));
    }

    match rule.query_type {
        SelectorQueryType::This => SelectOutcome::Hit(SelectResult::Dom(root)),
        SelectorQueryType::Css => match css::select(doc, root, &rule.selector) {
            Ok(nodes) => nodes
                .first()
                .copied()
                .map(|node| SelectOutcome::Hit(SelectResult::Dom(node)))
                .unwrap_or(SelectOutcome::Miss),
            Err(err) => {
                errors.push(ParseError::new(PARSER_ERROR, err.to_string()));
                SelectOutcome::Failed
            }
        },
        SelectorQueryType::Xpath => match xpath::evaluate(doc, root, &rule.selector) {
            Ok(XPathValue::NodeSet(nodes)) => match nodes.first().copied() {
                None => SelectOutcome::Miss,
                Some(XPathNode::Node(node)) => SelectOutcome::Hit(SelectResult::Dom(node)),
                Some(XPathNode::Attribute { owner, index }) => {
                    let value = doc
                        .attributes(owner)
                        .get(index as usize)
                        .map(|attr| attr.value.clone())
                        .unwrap_or_default();
                    SelectOutcome::Hit(SelectResult::Text(value))
                }
            },
            Ok(value) => SelectOutcome::Hit(SelectResult::Text(value.to_xpath_string())),
            Err(err) => {
                errors.push(ParseError::new(PARSER_ERROR, err.to_string()));
                SelectOutcome::Failed
            }
        },
        SelectorQueryType::JsonPath => {
            errors.push(ParseError::new(
                INTERNAL_ERROR,
                "Unknown selector typejsonPath",
            ));
            SelectOutcome::Failed
        }
    }
}

fn first_attribute(doc: &Document, node: NodeId, parameter: &str) -> Option<String> {
    for key in parameter.split(',') {
        let key = key.trim();
        if key.is_empty() {
            continue;
        }
        if let Some(value) = doc.attribute(node, key)
            && !value.is_empty()
        {
            return Some(value.to_string());
        }
    }
    None
}

fn extract(
    doc: &Document,
    rule: &SelectorRule,
    selected: SelectResult,
    errors: &mut Vec<ParseError>,
) -> Option<String> {
    match selected {
        SelectResult::Text(value) => Some(value),
        SelectResult::Dom(node) => match rule.function {
            SelectorFunctionType::Text => Some(doc.text_content(node)),
            SelectorFunctionType::Raw => Some(doc.outer_html(node)),
            SelectorFunctionType::Attribute => {
                if let Some(value) = first_attribute(doc, node, &rule.parameter) {
                    Some(value)
                } else if !rule.default_value.is_empty() {
                    Some(rule.default_value.clone())
                } else {
                    errors.push(ParseError::new(
                        ELEMENT_NOT_FOUND,
                        format!(
                            "Selector {} not found any {} attributes. reg: {}, replace: {}",
                            rule.selector, rule.parameter, rule.regex, rule.replace
                        ),
                    ));
                    None
                }
            }
        },
    }
}

fn regex_replace(
    rule: &SelectorRule,
    input: Option<String>,
    errors: &mut Vec<ParseError>,
) -> Option<String> {
    let value = input?;
    if rule.regex.is_empty() {
        return Some(value);
    }
    let re = match Regex::new(&rule.regex) {
        Ok(re) => re,
        Err(err) => {
            errors.push(ParseError::new(
                PARSER_ERROR,
                format!("Selector {} regex error: {}", rule.selector, err),
            ));
            return None;
        }
    };
    let Some(caps) = re.captures(&value) else {
        errors.push(ParseError::new(
            ELEMENT_NOT_FOUND,
            format!("Selector {} regex not match", rule.selector),
        ));
        return None;
    };
    if rule.replace.is_empty() {
        let last = caps
            .get(caps.len().saturating_sub(1))
            .map(|m| m.as_str().to_string())
            .unwrap_or_default();
        return Some(last);
    }

    let mut replaced = rule.replace.clone();
    for i in (1..caps.len()).rev() {
        let captured = caps.get(i).map(|m| m.as_str()).unwrap_or("");
        let token = format!("${i}");
        replaced = replaced.replace(&token, captured);
    }
    Some(replaced)
}

fn transform(
    js: &mut Option<boa_engine::Context>,
    input: Option<String>,
    rule: &SelectorRule,
    errors: &mut Vec<ParseError>,
) -> Option<String> {
    let result = input?;
    match &rule.script {
        SelectorScript::Output => Some(result),
        SelectorScript::Replace { values } => {
            let mut result = result;
            for (key, value) in values {
                result = result.replace(key, value);
            }
            Some(result)
        }
        SelectorScript::JavaScript { source } => {
            let context = js.get_or_insert_with(boa_engine::Context::default);
            let global = context.global_object();
            if let Err(err) = global.set(
                js_string!("$arg"),
                JsString::from(result.as_str()),
                false,
                context,
            ) {
                errors.push(ParseError::new(
                    PARSER_ERROR,
                    format!("Selector {} script error: {err}", rule.selector),
                ));
                return None;
            }
            let value = match context.eval(Source::from_bytes(source.as_bytes())) {
                Ok(value) => value,
                Err(err) => {
                    errors.push(ParseError::new(
                        PARSER_ERROR,
                        format!("Selector {} script error: {err}", rule.selector),
                    ));
                    return None;
                }
            };
            match value.to_string(context) {
                Ok(js_string) => Some(js_string.to_std_string_escaped()),
                Err(err) => {
                    errors.push(ParseError::new(
                        PARSER_ERROR,
                        format!("Selector {} script error: {err}", rule.selector),
                    ));
                    None
                }
            }
        }
    }
}

fn apply_rule(
    doc: &Document,
    root: NodeId,
    rule: &SelectorRule,
    js: &mut Option<boa_engine::Context>,
    errors: &mut Vec<ParseError>,
) -> Option<String> {
    if is_placeholder(rule) {
        return None;
    }

    let extracted = match select(doc, root, rule, errors) {
        SelectOutcome::Failed => return None,
        SelectOutcome::Miss => {
            if !rule.default_value.is_empty() {
                rule.default_value.clone()
            } else {
                errors.push(ParseError::new(
                    ELEMENT_NOT_FOUND,
                    format!("Selector {} not found any elements", rule.selector),
                ));
                return None;
            }
        }
        SelectOutcome::Hit(selected) => extract(doc, rule, selected, errors)?,
    };

    let value = regex_replace(rule, Some(extracted), errors);
    let value = transform(js, value, rule, errors);
    if value.is_some() {
        return value;
    }
    if !rule.default_value.is_empty() {
        return Some(rule.default_value.clone());
    }
    None
}

pub fn html_parser(html: &str, config: &ParserConfig) -> Result<HtmlParseResult, ParseError> {
    let doc = parse_html5(html).map_err(|err| ParseError::new(PARSER_ERROR, err.to_string()))?;
    let root = doc
        .root_element()
        .ok_or_else(|| ParseError::new(INTERNAL_ERROR, "document has no root element"))?;

    let mut result = HtmlParseResult {
        values: HashMap::with_capacity(config.selectors.len()),
        errors: Vec::new(),
    };
    let mut js = None;

    for (key, rule) in &config.selectors {
        if let Some(value) = apply_rule(&doc, root, rule, &mut js, &mut result.errors) {
            result.values.insert(key.clone(), value);
        }
    }
    Ok(result)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn rule(selector: &str) -> SelectorRule {
        SelectorRule {
            selector: selector.to_string(),
            query_type: SelectorQueryType::Css,
            function: SelectorFunctionType::Text,
            parameter: String::new(),
            regex: String::new(),
            replace: String::new(),
            script: SelectorScript::Output,
            default_value: String::new(),
        }
    }

    fn config(selectors: Vec<(&str, SelectorRule)>) -> ParserConfig {
        ParserConfig {
            selectors: selectors
                .into_iter()
                .map(|(key, value)| (key.to_string(), value))
                .collect(),
            extras: Vec::new(),
        }
    }

    fn parse_ok(html: &str, selectors: Vec<(&str, SelectorRule)>) -> HtmlParseResult {
        html_parser(html, &config(selectors)).expect("html_parser should succeed")
    }

    #[test]
    fn xpath_text_hit() {
        let mut selector = rule("//h1/text()");
        selector.query_type = SelectorQueryType::Xpath;
        let parsed = parse_ok("<h1>English Title</h1>", vec![("title", selector)]);
        assert_eq!(
            parsed.values.get("title").map(String::as_str),
            Some("English Title")
        );
        assert!(parsed.errors.is_empty());
    }

    #[test]
    fn css_text_hit() {
        let parsed = parse_ok(
            r#"<div class="glink">Gallery Title</div>"#,
            vec![("title", rule(".glink"))],
        );
        assert_eq!(
            parsed.values.get("title").map(String::as_str),
            Some("Gallery Title")
        );
        assert!(parsed.errors.is_empty());
    }

    #[test]
    fn attribute_comma_fallback() {
        let mut selector = rule("img");
        selector.function = SelectorFunctionType::Attribute;
        selector.parameter = "data-src,src".to_string();
        let parsed = parse_ok(
            r#"<img src="fallback.jpg"><img data-src="real.jpg" src="fallback.jpg">"#,
            vec![("url", selector)],
        );
        assert_eq!(
            parsed.values.get("url").map(String::as_str),
            Some("fallback.jpg")
        );
        assert!(parsed.errors.is_empty());
    }

    #[test]
    fn regex_uses_last_capture_group() {
        let mut selector = rule(".count");
        selector.regex = r"(\w+) (\d+)".to_string();
        let parsed = parse_ok(
            r#"<div class="count">pages 42</div>"#,
            vec![("count", selector)],
        );
        assert_eq!(parsed.values.get("count").map(String::as_str), Some("42"));
        assert!(parsed.errors.is_empty());
    }

    #[test]
    fn regex_replace_expands_groups_high_to_low() {
        let mut selector = rule(".ir");
        selector.function = SelectorFunctionType::Attribute;
        selector.parameter = "style".to_string();
        selector.regex = r"background-position:-?(\d+)px -?(\d+)px".to_string();
        selector.replace = r"5-$1/16-($2-1)/40".to_string();
        let parsed = parse_ok(
            r#"<div class="ir" style="background-position:-80px -1px"></div>"#,
            vec![("rating", selector)],
        );
        assert_eq!(
            parsed.values.get("rating").map(String::as_str),
            Some("5-80/16-(1-1)/40")
        );
        assert!(parsed.errors.is_empty());
    }

    #[test]
    fn default_value_on_miss_records_no_error() {
        let mut selector = rule(".missing");
        selector.default_value = "fallback".to_string();
        let parsed = parse_ok("<div></div>", vec![("title", selector)]);
        assert_eq!(
            parsed.values.get("title").map(String::as_str),
            Some("fallback")
        );
        assert!(parsed.errors.is_empty());
    }

    #[test]
    fn field_errors_do_not_abort_other_fields() {
        let mut bad_css = rule("[[[");
        bad_css.query_type = SelectorQueryType::Css;
        let mut bad_regex = rule(".title");
        bad_regex.regex = "(".to_string();
        let mut bad_js = rule(".title");
        bad_js.script = SelectorScript::JavaScript {
            source: "throw 'boom'".to_string(),
        };

        let parsed = parse_ok(
            r#"<div class="title">Keep</div>"#,
            vec![
                ("ok", rule(".title")),
                ("css", bad_css),
                ("regex", bad_regex),
                ("js", bad_js),
            ],
        );

        assert_eq!(parsed.values.get("ok").map(String::as_str), Some("Keep"));
        assert!(!parsed.values.contains_key("css"));
        assert!(!parsed.values.contains_key("regex"));
        assert!(!parsed.values.contains_key("js"));
        assert_eq!(parsed.errors.len(), 3);
        assert!(parsed.errors.iter().any(|err| err.code == PARSER_ERROR));
        assert!(
            parsed
                .errors
                .iter()
                .any(|err| err.message.contains("regex error"))
        );
        assert!(
            parsed
                .errors
                .iter()
                .any(|err| err.message.contains("script error"))
        );
    }

    #[test]
    fn valid_html_returns_ok() {
        let parsed = html_parser("<p>ok</p>", &config(vec![("t", rule("p"))]));
        assert!(parsed.is_ok());
    }
}
