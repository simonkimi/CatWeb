use std::collections::HashMap;

use crate::errors::{HtmlParseResult, ParseError};
use crate::models::selector::ParserConfig;

use super::context::HtmlContext;

pub fn html_parser(html: &str, config: &ParserConfig) -> Result<HtmlParseResult, ParseError> {
    let mut context = HtmlContext::new(html)?;
    let root = context.root;
    let mut values = HashMap::with_capacity(config.selectors.len());
    for (key, rule) in &config.selectors {
        if let Some(value) = context.string(root, Some(rule), key) {
            values.insert(key.clone(), value);
        }
    }
    Ok(HtmlParseResult {
        values,
        errors: context.errors,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::errors::PARSER_ERROR;
    use crate::models::selector::{
        SelectorFunctionType, SelectorQueryType, SelectorRule, SelectorScript,
    };

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
