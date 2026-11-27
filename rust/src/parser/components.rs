use xmloxide::NodeId;

use super::context::HtmlContext;
use crate::models::{
    result::{EnvResult, ImageResult, TagResult},
    selector::{ParserConfig, SelectorQueryType, SelectorRule},
};

fn field_path(prefix: &str, key: &str) -> String {
    if prefix.is_empty() {
        key.to_string()
    } else {
        format!("{prefix}.{key}")
    }
}

pub(super) fn extras(
    context: &mut HtmlContext,
    root: NodeId,
    config: &ParserConfig,
) -> Vec<EnvResult> {
    config
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
        .collect()
}

pub(super) fn image(
    context: &mut HtmlContext,
    node: NodeId,
    config: &ParserConfig,
    prefix: &str,
    key: &str,
) -> Option<ImageResult> {
    let keys =
        ["url", "cacheKey", "width", "height", "x", "y"].map(|field| format!("{key}.{field}"));
    if !keys.iter().any(|key| {
        config
            .selectors
            .get(key)
            .is_some_and(|rule| !rule.is_placeholder())
    }) {
        return None;
    }
    Some(ImageResult {
        url: context.string(
            node,
            config.selectors.get(&keys[0]),
            &field_path(prefix, &keys[0]),
        ),
        cache_key: context.string(
            node,
            config.selectors.get(&keys[1]),
            &field_path(prefix, &keys[1]),
        ),
        width: context.double(
            node,
            config.selectors.get(&keys[2]),
            &field_path(prefix, &keys[2]),
        ),
        height: context.double(
            node,
            config.selectors.get(&keys[3]),
            &field_path(prefix, &keys[3]),
        ),
        x: context.double(
            node,
            config.selectors.get(&keys[4]),
            &field_path(prefix, &keys[4]),
        ),
        y: context.double(
            node,
            config.selectors.get(&keys[5]),
            &field_path(prefix, &keys[5]),
        ),
    })
}

pub(super) fn tags(
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
        .nodes(node, config.selectors.get(key), &field_path(prefix, key))
        .into_iter()
        .enumerate()
        .map(|(index, tag)| {
            let prefix = field_path(prefix, &format!("{key}[{index}]"));
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
