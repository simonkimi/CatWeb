use crate::errors::ParseError;
use crate::models::{
    result::{CommentResult, GalleryParserResult, GalleryPreviewItem},
    selector::ParserConfig,
};

use super::{
    components::{extras, image, tags},
    context::HtmlContext,
};

/// Parse gallery metadata and ordered preview/comment collections from one HTML document.
pub fn gallery_parser(
    html: &str,
    config: &ParserConfig,
) -> Result<GalleryParserResult, ParseError> {
    let mut context = HtmlContext::new(html)?;
    let root = context.root;
    let mut string = |key: &str| context.string(root, config.selectors.get(key), key);
    let mut result = GalleryParserResult {
        title: string("title"),
        subtitle: string("subtitle"),
        language: string("language"),
        upload_time: string("uploadTime"),
        description: string("description"),
        next_page: string("nextPage"),
        is_success: string("success").map(|_| true),
        fail_message: string("failure"),
        ..GalleryParserResult::default()
    };
    result.star = context.double(root, config.selectors.get("rating"), "rating");
    result.image_count = context.integer(root, config.selectors.get("imageCount"), "imageCount");
    result.page_count = context.integer(root, config.selectors.get("pageCount"), "pageCount");
    result.count_per_page =
        context.integer(root, config.selectors.get("countPerPage"), "countPerPage");
    result.cover_image = image(&mut context, root, config, "", "cover");
    result.tags = tags(&mut context, root, config, "", "tag");
    result.badges = tags(&mut context, root, config, "", "badge");
    result.envs = extras(&mut context, root, config);

    for (index, node) in context
        .nodes(root, config.selectors.get("thumbnail"), "thumbnail")
        .into_iter()
        .enumerate()
    {
        let prefix = format!("previews[{index}]");
        result.previews.push(GalleryPreviewItem {
            preview_image: image(&mut context, node, config, &prefix, "thumbnail"),
            target: context.string(
                node,
                config.selectors.get("thumbnail.target"),
                &format!("{prefix}.target"),
            ),
        });
    }
    for (index, node) in context
        .nodes(root, config.selectors.get("comment"), "comment")
        .into_iter()
        .enumerate()
    {
        let prefix = format!("comments[{index}]");
        result.comments.push(CommentResult {
            username: context.string(
                node,
                config.selectors.get("comment.username"),
                &format!("{prefix}.username"),
            ),
            content: context.string(
                node,
                config.selectors.get("comment.content"),
                &format!("{prefix}.content"),
            ),
            time: context.string(
                node,
                config.selectors.get("comment.time"),
                &format!("{prefix}.time"),
            ),
            score: context.string(
                node,
                config.selectors.get("comment.score"),
                &format!("{prefix}.score"),
            ),
            avatar: image(&mut context, node, config, &prefix, "comment.avatar"),
        });
    }
    result.errors = context.errors;
    Ok(result)
}

#[cfg(test)]
#[path = "gallery_parser_tests.rs"]
mod tests;
