use std::collections::HashMap;
use std::fmt;

pub const INTERNAL_ERROR: i32 = 0;
pub const PARSER_ERROR: i32 = 1;
pub const ELEMENT_NOT_FOUND: i32 = 2;
pub const CONVERTER_ERROR: i32 = 3;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ParseError {
    pub code: i32,
    pub message: String,
}

impl ParseError {
    pub fn new(code: i32, message: impl Into<String>) -> Self {
        Self {
            code,
            message: message.into(),
        }
    }

    fn kind_name(&self) -> &'static str {
        match self.code {
            INTERNAL_ERROR => "InternalError",
            PARSER_ERROR => "ParserError",
            ELEMENT_NOT_FOUND => "ElementNotFoundError",
            CONVERTER_ERROR => "ConverterError",
            _ => "UnknownError",
        }
    }
}

impl fmt::Display for ParseError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "[{}] {}", self.kind_name(), self.message)
    }
}

impl std::error::Error for ParseError {}

#[derive(Debug, Clone, Default)]
pub struct HtmlParseResult {
    pub values: HashMap<String, String>,
    pub errors: Vec<ParseError>,
}
