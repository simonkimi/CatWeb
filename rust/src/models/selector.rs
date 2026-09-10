use std::collections::HashMap;

use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub enum SelectorQueryType {
    #[serde(rename = "self")]
    This,
    Css,
    Xpath,
    JsonPath,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub enum SelectorFunctionType {
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

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
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

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[allow(dead_code)]
pub struct ExtraSelectorRule {
    id: String,
    persistent: bool,
    selector: SelectorRule,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
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
