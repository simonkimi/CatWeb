use xmloxide::NodeId;

use crate::errors::{PARSER_ERROR, ParseError};
use crate::models::{
    result::{EnvResult, ImageResult, ListParserResult, ListParserResultItem, TagResult},
    selector::{ParserConfig, SelectorQueryType, SelectorRule},
};

use super::context::HtmlContext;

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
    result.envs = config
        .extras
        .iter()
        .enumerate()
        .map(|(index, extra)| EnvResult {
            id: extra.id.clone(),
            global: extra.persistent,
            value: context.string(
                root,
                Some(&extra.selector),
                &format!("extras[{index}].{}", extra.id),
            ),
        })
        .collect();

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
        item.preview_image = preview(&mut context, node, config, &prefix);
        item.tags = tags(&mut context, node, config, &prefix, "tag");
        item.badges = tags(&mut context, node, config, &prefix, "badge");
        result.items.push(item);
    }
    result.errors = context.errors;
    Ok(result)
}

fn preview(
    context: &mut HtmlContext,
    node: NodeId,
    config: &ParserConfig,
    prefix: &str,
) -> Option<ImageResult> {
    const KEYS: [&str; 6] = [
        "preview.url",
        "preview.cacheKey",
        "preview.width",
        "preview.height",
        "preview.x",
        "preview.y",
    ];
    if !KEYS.iter().any(|key| {
        config
            .selectors
            .get(*key)
            .is_some_and(|rule| !rule.is_placeholder())
    }) {
        return None;
    }
    Some(ImageResult {
        url: context.string(
            node,
            config.selectors.get(KEYS[0]),
            &format!("{prefix}.{}", KEYS[0]),
        ),
        cache_key: context.string(
            node,
            config.selectors.get(KEYS[1]),
            &format!("{prefix}.{}", KEYS[1]),
        ),
        width: context.double(
            node,
            config.selectors.get(KEYS[2]),
            &format!("{prefix}.{}", KEYS[2]),
        ),
        height: context.double(
            node,
            config.selectors.get(KEYS[3]),
            &format!("{prefix}.{}", KEYS[3]),
        ),
        x: context.double(
            node,
            config.selectors.get(KEYS[4]),
            &format!("{prefix}.{}", KEYS[4]),
        ),
        y: context.double(
            node,
            config.selectors.get(KEYS[5]),
            &format!("{prefix}.{}", KEYS[5]),
        ),
    })
}

fn tags(
    context: &mut HtmlContext,
    node: NodeId,
    config: &ParserConfig,
    prefix: &str,
    key: &str,
) -> Vec<TagResult> {
    let text_key = format!("{key}.text");
    let color_key = format!("{key}.color");
    let category_key = format!("{key}.category");
    let self_text = SelectorRule {
        query_type: SelectorQueryType::This,
        ..SelectorRule::default()
    };
    let text_rule = config
        .selectors
        .get(&text_key)
        .filter(|rule| !rule.is_placeholder())
        .unwrap_or(&self_text);
    context
        .nodes(node, config.selectors.get(key), &format!("{prefix}.{key}"))
        .into_iter()
        .enumerate()
        .map(|(index, tag)| {
            let prefix = format!("{prefix}.{key}[{index}]");
            TagResult {
                text: context.string(tag, Some(text_rule), &format!("{prefix}.text")),
                color: context.string(
                    tag,
                    config.selectors.get(&color_key),
                    &format!("{prefix}.color"),
                ),
                category: context.string(
                    tag,
                    config.selectors.get(&category_key),
                    &format!("{prefix}.category"),
                ),
            }
        })
        .collect()
}

#[cfg(test)]
#[path = "list_parser_tests.rs"]
mod tests;
