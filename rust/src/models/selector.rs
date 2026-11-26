use std::collections::HashMap;

use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Copy, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub enum SelectorQueryType {
    #[serde(rename = "self")]
    This,
    #[default]
    Css,
    Xpath,
    JsonPath,
}

#[derive(Debug, Clone, Copy, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub enum SelectorFunctionType {
    #[default]
    Text,
    Attribute,
    Raw,
}

#[derive(Debug, Clone, Default, Serialize, Deserialize)]
#[serde(tag = "type", rename_all = "camelCase")]
pub enum SelectorScript {
    #[default]
    Output,
    Replace {
        #[serde(default)]
        values: HashMap<String, String>,
    },
    JavaScript {
        #[serde(default)]
        source: String,
    },
}

#[derive(Debug, Clone, Default, Serialize, Deserialize)]
#[serde(default, rename_all = "camelCase")]
pub struct SelectorRule {
    pub selector: String,
    pub query_type: SelectorQueryType,
    pub function: SelectorFunctionType,
    pub parameter: String,
    pub regex: String,
    pub replace: String,
    #[serde(default)]
    pub script: SelectorScript,
    pub default_value: String,
}

impl SelectorRule {
    /// An editor placeholder has no extraction or transformation configured.
    pub(crate) fn is_placeholder(&self) -> bool {
        self.selector.trim().is_empty()
            && matches!(
                self.query_type,
                SelectorQueryType::Css | SelectorQueryType::Xpath
            )
            && self.function == SelectorFunctionType::Text
            && self.parameter.is_empty()
            && self.regex.is_empty()
            && self.default_value.is_empty()
            && matches!(self.script, SelectorScript::Output)
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ExtraSelectorRule {
    pub id: String,
    #[serde(default)]
    pub persistent: bool,
    #[serde(default)]
    pub selector: SelectorRule,
}

#[derive(Debug, Clone, Default, Serialize, Deserialize)]
#[serde(default, rename_all = "camelCase")]
pub struct ParserConfig {
    pub selectors: HashMap<String, SelectorRule>,
    pub extras: Vec<ExtraSelectorRule>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[allow(dead_code)]
pub enum EndpointKind {
    List,
    Gallery,
    Reader,
    Autocomplete,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[allow(dead_code)]
pub struct ParserRule {
    id: String,
    name: String,
    kind: EndpointKind,
    config: ParserConfig,
}
