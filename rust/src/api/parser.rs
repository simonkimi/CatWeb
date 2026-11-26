use crate::errors::ParseError;
use crate::models::{result::ListParserResult, selector::ParserConfig};

/// Parse an HTML list. FRB runs this task off the Dart UI thread.
pub fn parse_list(html: String, config: ParserConfig) -> Result<ListParserResult, ParseError> {
    crate::parser::list_parser(&html, &config)
}
