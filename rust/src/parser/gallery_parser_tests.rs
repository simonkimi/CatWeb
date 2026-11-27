use serde_json::{Value, json};

use super::*;
use crate::errors::{CONVERTER_ERROR, ELEMENT_NOT_FOUND, PARSER_ERROR};

fn parse(html: &str, selectors: Value) -> GalleryParserResult {
    let config: ParserConfig = serde_json::from_value(json!({"selectors": selectors})).unwrap();
    gallery_parser(html, &config).unwrap()
}

#[test]
fn metadata_only_and_empty_configuration_are_supported() {
    let result = parse("<h1>Gallery</h1>", json!({"title": {"selector": "h1"}}));
    assert_eq!(result.title.as_deref(), Some("Gallery"));
    assert!(result.previews.is_empty());
    assert!(result.comments.is_empty());
    assert!(result.tags.is_empty());
    assert!(result.badges.is_empty());
    assert!(result.cover_image.is_none());
    assert!(result.errors.is_empty());
    assert_eq!(parse("", json!({})), GalleryParserResult::default());
}

#[test]
fn page_fields_images_tags_and_extras_are_structured() {
    let config: ParserConfig = serde_json::from_value(json!({
        "selectors": {
            "title": {"selector": "h1"}, "subtitle": {"selector": "h2"},
            "language": {"selector": "#lang"}, "uploadTime": {"selector": "time"},
            "description": {"selector": "p", "function": "raw"},
            "rating": {"selector": "#rating", "script": {"type": "javaScript", "source": "Number($arg)/2"}},
            "imageCount": {"selector": "#count", "regex": "\\d+"},
            "pageCount": {"selector": "#pages"}, "countPerPage": {"selector": "#size"},
            "cover.url": {"selector": "img", "function": "attribute", "parameter": "data-src,src"},
            "cover.width": {"selector": "img", "function": "attribute", "parameter": "width"},
            "cover.height": {"selector": "img", "function": "attribute", "parameter": "height"},
            "cover.x": {"defaultValue": "3", "regex": "missing"},
            "cover.cacheKey": {"selector": "img", "function": "attribute", "parameter": "data-key"},
            "tag": {"selector": ".tag"}, "badge": {"selector": ".badge"},
            "badge.category": {"function": "attribute", "parameter": "data-category"},
            "nextPage": {"selector": "a", "function": "attribute", "parameter": "href"},
            "success": {"selector": "#ok"}, "failure": {},
        },
        "extras": [{"id":"token", "persistent":true, "selector":{"selector":"#token"}}]
    })).unwrap();
    let result = gallery_parser(r#"<h1>Title</h1><h2>Subtitle</h2><b id="lang">EN</b><time>Today</time><p>Description</p><b id="rating">9</b><b id="count">42 images</b><b id="pages">2</b><b id="size">40</b><img src="fallback" data-src="cover.jpg" data-key="cover" width="100" height="80"><i class="tag">Tag</i><i class="badge" data-category="group">Badge</i><a href="?p=1">Next</a><b id="ok">OK</b><b id="token">secret</b>"#, &config).unwrap();
    assert_eq!(result.title.as_deref(), Some("Title"));
    assert_eq!(result.subtitle.as_deref(), Some("Subtitle"));
    assert_eq!(result.language.as_deref(), Some("EN"));
    assert_eq!(result.upload_time.as_deref(), Some("Today"));
    assert_eq!(result.description.as_deref(), Some("<p>Description</p>"));
    assert_eq!(result.star, Some(4.5));
    assert_eq!(
        (result.image_count, result.page_count, result.count_per_page),
        (Some(42), Some(2), Some(40))
    );
    let cover = result.cover_image.unwrap();
    assert_eq!(cover.url.as_deref(), Some("cover.jpg"));
    assert_eq!(cover.cache_key.as_deref(), Some("cover"));
    assert_eq!(
        (cover.width, cover.height, cover.x),
        (Some(100.0), Some(80.0), Some(3.0))
    );
    assert_eq!(result.tags[0].text.as_deref(), Some("Tag"));
    assert_eq!(result.badges[0].category.as_deref(), Some("group"));
    assert_eq!(result.next_page.as_deref(), Some("?p=1"));
    assert_eq!(result.is_success, Some(true));
    assert!(result.envs[0].global);
    assert_eq!(result.envs[0].value.as_deref(), Some("secret"));
    assert_eq!(result.errors.len(), 1);
    assert!(result.errors[0].message.starts_with("cover.x:"));
}

#[test]
fn previews_preserve_order_scope_and_missing_images_and_targets() {
    let result = parse(
        r#"<div class="thumb"><a href="one"><img src="one.jpg"></a></div><div class="thumb"><a href="two"></a></div><div class="thumb"><img src="three.jpg"></div>"#,
        json!({
            "thumbnail": {"selector": "//div[@class='thumb']", "queryType": "xpath", "regex":"(", "script":{"type":"javaScript","source":"throw 1"}},
            "thumbnail.target": {"selector": ".//a/@href", "queryType": "xpath"},
            "thumbnail.url": {"selector": ".//img/@src", "queryType": "xpath"},
        }),
    );
    assert_eq!(result.previews.len(), 3);
    assert_eq!(result.previews[0].target.as_deref(), Some("one"));
    assert_eq!(
        result.previews[0]
            .preview_image
            .as_ref()
            .unwrap()
            .url
            .as_deref(),
        Some("one.jpg")
    );
    assert_eq!(result.previews[1].target.as_deref(), Some("two"));
    assert!(
        result.previews[1]
            .preview_image
            .as_ref()
            .unwrap()
            .url
            .is_none()
    );
    assert!(result.previews[2].target.is_none());
    assert!(
        result
            .errors
            .iter()
            .any(|e| e.message.starts_with("previews[1].thumbnail.url:"))
    );
    assert!(
        result
            .errors
            .iter()
            .any(|e| e.message.starts_with("previews[2].target:"))
    );
    assert!(result.errors.iter().all(|e| e.code == ELEMENT_NOT_FOUND));
}

#[test]
fn comments_include_string_scores_and_individual_avatar_geometry() {
    let result = parse(
        r#"<article><b>Alice</b><p>Hello</p><time>Today</time><i>+12</i><img src="alice.png" width="40" data-x="2"></article><article><b>Bob</b><p>World</p><time>Yesterday</time><i>-3</i><img src="bob.png" width="48" data-x="4"></article>"#,
        json!({
            "comment": {"selector": "article"},
            "comment.username": {"selector": "b"},
            "comment.content": {"selector": ".//p/text()", "queryType": "xpath"},
            "comment.time": {"selector": "time"}, "comment.score": {"selector": "i"},
            "comment.avatar.url": {"selector": "img", "function": "attribute", "parameter": "src"},
            "comment.avatar.width": {"selector": "img", "function": "attribute", "parameter": "width"},
            "comment.avatar.x": {"selector": "img", "function": "attribute", "parameter": "data-x"}
        }),
    );
    assert_eq!(result.comments.len(), 2);
    assert_eq!(result.comments[0].username.as_deref(), Some("Alice"));
    assert_eq!(result.comments[1].content.as_deref(), Some("World"));
    assert_eq!(result.comments[1].time.as_deref(), Some("Yesterday"));
    assert_eq!(result.comments[1].score.as_deref(), Some("-3"));
    let avatar = result.comments[1].avatar.as_ref().unwrap();
    assert_eq!(avatar.url.as_deref(), Some("bob.png"));
    assert_eq!((avatar.width, avatar.x), (Some(48.0), Some(4.0)));
    assert!(result.errors.is_empty());
}

#[test]
fn field_errors_do_not_abort_metadata_or_other_collections() {
    let result = parse(
        "<h1>Keep</h1><i>NaN</i><b>invalid</b><article><p>Comment</p></article>",
        json!({
            "title": {"selector":"h1"}, "rating":{"selector":"i"},
            "imageCount":{"selector":"b"}, "pageCount":{"selector":"[[["},
            "countPerPage":{"queryType":"jsonPath","selector":"$.size"},
            "thumbnail":{"queryType":"xpath","selector":"//["},
            "tag":{"selector":"[[["}, "comment":{"selector":"article"},
            "comment.content":{"selector":"p"},
        }),
    );
    assert_eq!(result.title.as_deref(), Some("Keep"));
    assert_eq!(result.comments[0].content.as_deref(), Some("Comment"));
    assert_eq!(
        result
            .errors
            .iter()
            .filter(|e| e.code == CONVERTER_ERROR)
            .count(),
        2
    );
    assert_eq!(
        result
            .errors
            .iter()
            .filter(|e| e.code == PARSER_ERROR)
            .count(),
        4
    );
    assert!(
        result
            .errors
            .iter()
            .any(|e| e.message.starts_with("thumbnail:"))
    );
}

#[test]
fn collection_scalars_and_attributes_are_errors_but_empty_matches_are_valid() {
    for query in ["count(//a)", "//a/@href"] {
        let result = parse(
            "<a href='x'></a>",
            json!({"thumbnail":{"selector":query,"queryType":"xpath"}}),
        );
        assert_eq!(result.errors.len(), 1);
        assert!(result.errors[0].message.starts_with("thumbnail:"));
    }
    let result = parse(
        "<p>Empty</p>",
        json!({"thumbnail":{"selector":"a"},"comment":{"selector":"article"}}),
    );
    assert!(result.errors.is_empty());
    assert!(result.previews.is_empty());
}

#[test]
fn comment_scripts_are_isolated_and_default_tag_text_is_unchanged() {
    let result = parse(
        "<article>A</article><article>B</article><i>Tag</i>",
        json!({
            "comment":{"selector":"article"},
            "comment.content":{"queryType":"self","script":{"type":"javaScript","source":"globalThis.n=(globalThis.n||0)+1;$arg+n"}},
            "comment.score":{"queryType":"self","script":{"type":"replace","values":{"A":"+1","B":"-1"}}},
            "badge":{"selector":"i"},"badge.text":{}
        }),
    );
    assert_eq!(result.comments[0].content.as_deref(), Some("A1"));
    assert_eq!(result.comments[1].content.as_deref(), Some("B1"));
    assert_eq!(result.comments[1].score.as_deref(), Some("-1"));
    assert_eq!(result.badges[0].text.as_deref(), Some("Tag"));
    assert!(result.errors.is_empty());
}
