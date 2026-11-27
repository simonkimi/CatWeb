use crate::errors::{PARSER_ERROR, ParseError};
use crate::models::{
    result::{ListParserResult, ListParserResultItem},
    selector::{ParserConfig, SelectorQueryType},
};

use super::{
    components::{extras, image, tags},
    context::HtmlContext,
};

/// Parse an HTML list using the selector keys from the current site schema.
pub fn list_parser(html: &str, config: &ParserConfig) -> Result<ListParserResult, ParseError> {
    let item = config
        .selectors
        .get("item")
        .ok_or_else(|| ParseError::new(PARSER_ERROR, "item: a node query is required"))?;
    if item.selector.trim().is_empty() && item.query_type != SelectorQueryType::This {
        return Err(ParseError::new(
            PARSER_ERROR,
            "item: a node query is required; use self for a single item",
        ));
    }

    let mut context = HtmlContext::new(html)?;
    let root = context.root;
    let mut result = ListParserResult {
        next_page: context.string(root, config.selectors.get("nextPage"), "nextPage"),
        is_success: context
            .string(root, config.selectors.get("success"), "success")
            .map(|_| true),
        fail_message: context.string(root, config.selectors.get("failure"), "failure"),
        ..ListParserResult::default()
    };
    result.envs = extras(&mut context, root, config);

    for (index, node) in context
        .nodes(root, Some(item), "item")
        .into_iter()
        .enumerate()
    {
        let prefix = format!("items[{index}]");
        let mut string =
            |key: &str| context.string(node, config.selectors.get(key), &format!("{prefix}.{key}"));
        let mut item = ListParserResultItem {
            title: string("title"),
            subtitle: string("subtitle"),
            upload_time: string("uploadTime"),
            language: string("language"),
            id_code: string("idCode"),
            paper: string("paper"),
            ..ListParserResultItem::default()
        };
        item.star = context.double(
            node,
            config.selectors.get("rating"),
            &format!("{prefix}.rating"),
        );
        item.image_count = context.integer(
            node,
            config.selectors.get("imageCount"),
            &format!("{prefix}.imageCount"),
        );
        item.preview_image = image(&mut context, node, config, &prefix, "preview");
        item.tags = tags(&mut context, node, config, &prefix, "tag");
        item.badges = tags(&mut context, node, config, &prefix, "badge");
        result.items.push(item);
    }
    result.errors = context.errors;
    Ok(result)
}

#[cfg(test)]
#[path = "list_parser_tests.rs"]
mod tests;
