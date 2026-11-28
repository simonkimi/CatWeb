use crate::errors::ParseError;
use crate::models::{
    result::{GalleryParserResult, ImageReaderResult, ListParserResult},
    selector::ParserConfig,
};

/// Parse an HTML list. FRB runs this task off the Dart UI thread.
pub fn parse_list(html: String, config: ParserConfig) -> Result<ListParserResult, ParseError> {
    crate::parser::list_parser(&html, &config)
}

/// Parse an HTML image reader, including all quality variants and metadata.
pub fn parse_reader(html: String, config: ParserConfig) -> Result<ImageReaderResult, ParseError> {
    crate::parser::reader_parser(&html, &config)
}

/// Parse an HTML gallery, including metadata, previews and comments.
pub fn parse_gallery(
    html: String,
    config: ParserConfig,
) -> Result<GalleryParserResult, ParseError> {
    crate::parser::gallery_parser(&html, &config)
}
