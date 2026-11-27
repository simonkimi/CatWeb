use boa_engine::{JsString, Source, js_string};
use regex::Regex;
use xmloxide::{
    Document, NodeId, css,
    html5::parse_html5,
    xpath::{self, XPathNode, XPathValue},
};

use crate::errors::{CONVERTER_ERROR, ELEMENT_NOT_FOUND, INTERNAL_ERROR, PARSER_ERROR, ParseError};
use crate::models::selector::{
    SelectorFunctionType, SelectorQueryType, SelectorRule, SelectorScript,
};

/// One parsed document per request. Nodes always retain their original XPath context.
pub(super) struct HtmlContext {
    doc: Document,
    pub root: NodeId,
    pub errors: Vec<ParseError>,
}

impl HtmlContext {
    pub fn new(html: &str) -> Result<Self, ParseError> {
        let doc =
            parse_html5(html).map_err(|err| ParseError::new(PARSER_ERROR, err.to_string()))?;
        let root = doc
            .root_element()
            .ok_or_else(|| ParseError::new(INTERNAL_ERROR, "document has no root element"))?;
        Ok(Self {
            doc,
            root,
            errors: Vec::new(),
        })
    }

    pub fn string(
        &mut self,
        root: NodeId,
        rule: Option<&SelectorRule>,
        path: &str,
    ) -> Option<String> {
        let start = self.errors.len();
        let value = apply_rule(&self.doc, root, rule?, &mut self.errors);
        self.annotate_errors(start, path);
        value
    }

    pub fn integer(
        &mut self,
        root: NodeId,
        rule: Option<&SelectorRule>,
        path: &str,
    ) -> Option<i64> {
        let value = self.string(root, rule, path)?;
        match value.parse() {
            Ok(value) => Some(value),
            Err(err) => {
                self.errors.push(ParseError::new(
                    CONVERTER_ERROR,
                    format!("{path}: cannot convert {value:?} to integer: {err}"),
                ));
                None
            }
        }
    }

    pub fn double(&mut self, root: NodeId, rule: Option<&SelectorRule>, path: &str) -> Option<f64> {
        let value = self.string(root, rule, path)?;
        match value.parse::<f64>() {
            Ok(number) if number.is_finite() => Some(number),
            _ => {
                self.errors.push(ParseError::new(
                    CONVERTER_ERROR,
                    format!("{path}: cannot convert {value:?} to a finite number"),
                ));
                None
            }
        }
    }

    /// Collections consume only the query; extraction and transformations are ignored.
    pub fn nodes(&mut self, root: NodeId, rule: Option<&SelectorRule>, path: &str) -> Vec<NodeId> {
        let Some(rule) = rule else { return Vec::new() };
        let result = match rule.query_type {
            SelectorQueryType::This => return vec![root],
            SelectorQueryType::Css | SelectorQueryType::Xpath
                if rule.selector.trim().is_empty() =>
            {
                return Vec::new();
            }
            SelectorQueryType::Css => {
                css::select(&self.doc, root, &rule.selector).map_err(|err| err.to_string())
            }
            SelectorQueryType::Xpath => match xpath::evaluate(&self.doc, root, &rule.selector) {
                Ok(XPathValue::NodeSet(nodes)) => nodes
                    .into_iter()
                    .map(|node| match node {
                        XPathNode::Node(node) => Ok(node),
                        XPathNode::Attribute { .. } => {
                            Err("collection queries cannot select attributes".to_string())
                        }
                    })
                    .collect(),
                Ok(_) => Err("collection queries must return a node set".to_string()),
                Err(err) => Err(err.to_string()),
            },
            SelectorQueryType::JsonPath => Err("JSONPath is not supported for HTML".to_string()),
        };
        match result {
            Ok(nodes) => nodes,
            Err(message) => {
                self.errors
                    .push(ParseError::new(PARSER_ERROR, format!("{path}: {message}")));
                Vec::new()
            }
        }
    }

    fn annotate_errors(&mut self, start: usize, path: &str) {
        for error in &mut self.errors[start..] {
            error.message = format!("{path}: {}", error.message);
        }
    }
}

enum SelectResult {
    Dom(NodeId),
    Text(String),
}

enum SelectOutcome {
    Hit(SelectResult),
    Miss,
    Failed,
}

fn select(
    doc: &Document,
    root: NodeId,
    rule: &SelectorRule,
    errors: &mut Vec<ParseError>,
) -> SelectOutcome {
    if matches!(rule.query_type, SelectorQueryType::This)
        || (rule.selector.trim().is_empty()
            && !matches!(rule.query_type, SelectorQueryType::JsonPath))
    {
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
                PARSER_ERROR,
                "JSONPath is not supported for HTML",
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
    input: Option<String>,
    rule: &SelectorRule,
    errors: &mut Vec<ParseError>,
) -> Option<String> {
    let result = input?;
    match &rule.script {
        SelectorScript::Output => Some(result),
        SelectorScript::Replace { values } => match values.get(&result) {
            Some(value) => Some(value.clone()),
            None => {
                errors.push(ParseError::new(
                    ELEMENT_NOT_FOUND,
                    format!(
                        "Selector {} script replace not found: {result}",
                        rule.selector
                    ),
                ));
                None
            }
        },
        SelectorScript::JavaScript { source } => {
            let context = &mut boa_engine::Context::default();
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
    errors: &mut Vec<ParseError>,
) -> Option<String> {
    if rule.is_placeholder() {
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
    let value = transform(value, rule, errors);
    if value.is_some() {
        return value;
    }
    if !rule.default_value.is_empty() {
        return Some(rule.default_value.clone());
    }
    None
}
