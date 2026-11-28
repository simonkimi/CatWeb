use crate::errors::ParseError;
use crate::models::{result::ImageReaderResult, selector::ParserConfig};

use super::{
    components::{comments, extras, image, tags},
    context::HtmlContext,
};

/// Extract one reader page; optional field failures remain in the result diagnostics.
pub fn reader_parser(html: &str, config: &ParserConfig) -> Result<ImageReaderResult, ParseError> {
    let mut context = HtmlContext::new(html)?;
    let root = context.root;
    let mut string = |key: &str| context.string(root, config.selectors.get(key), key);
    let mut result = ImageReaderResult {
        upload_time: string("uploadTime"),
        source: string("source"),
        rating: string("rating"),
        is_success: string("success").map(|_| true),
        fail_message: string("failure"),
        ..ImageReaderResult::default()
    };
    result.score = context.double(root, config.selectors.get("score"), "score");
    result.image = image(&mut context, root, config, "", "image");
    result.larger_image = image(&mut context, root, config, "", "largerImage");
    result.raw_image = image(&mut context, root, config, "", "rawImage");
    result.tags = tags(&mut context, root, config, "", "tag");
    result.badges = tags(&mut context, root, config, "", "badge");
    result.comments = comments(&mut context, root, config);
    result.envs = extras(&mut context, root, config);
    result.errors = context.errors;
    Ok(result)
}

#[cfg(test)]
#[path = "reader_parser_tests.rs"]
mod tests;
