use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
enum SelectorQueryType {
    #[serde(rename = "self")]
    This,
    Css,
    Xpath,
    JsonPath,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
enum SelectorFunctionType {
    Text,
    Attribute,
    Raw,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
struct SelectorRule {
    selector: String,
    query_type: SelectorQueryType,
    function: SelectorFunctionType,
    parameter: String,
    regex: String,
    replace: String,
    script: String,
    default_value: String,
}
