use serde_json::{Value, json};

use super::*;
use crate::errors::{CONVERTER_ERROR, PARSER_ERROR};

fn parse(html: &str, selectors: Value) -> ImageReaderResult {
    let config = serde_json::from_value(json!({"selectors": selectors})).unwrap();
    reader_parser(html, &config).unwrap()
}

#[test]
fn empty_and_placeholder_images_are_absent_and_bare_keys_are_not_aliases() {
    assert_eq!(parse("", json!({})), ImageReaderResult::default());
    let result = parse(
        "<a href='raw.jpg'>Raw</a>",
        json!({
            "image.url": {}, "largerImage.url": {}, "rawImage.width": {},
            "largerImage": {"selector": "a"},
            "rawImage": {"selector": "a", "function": "attribute", "parameter": "href"}
        }),
    );
    assert!(result.image.is_none());
    assert!(result.larger_image.is_none());
    assert!(result.raw_image.is_none());
    assert!(result.errors.is_empty());
}

#[test]
fn all_image_variants_preserve_url_cache_identity_and_geometry() {
    let mut selectors = serde_json::Map::new();
    for key in ["image", "largerImage", "rawImage"] {
        for field in ["url", "cacheKey", "width", "height", "x", "y"] {
            selectors.insert(
                format!("{key}.{field}"),
                json!({
                    "selector": format!("#{key}"), "function": "attribute", "parameter": field.to_lowercase()
                }),
            );
        }
    }
    let result = parse(
        "<img id='image' url='normal' cacheKey='n' width='100' height='200' x='1' y='2'>\
         <img id='largerImage' url='large' cacheKey='l' width='300' height='400' x='3' y='4'>\
         <img id='rawImage' url='raw' cacheKey='r' width='500' height='600' x='5' y='6'>",
        Value::Object(selectors),
    );
    for (image, url, cache, width, height, x, y) in [
        (result.image.unwrap(), "normal", "n", 100.0, 200.0, 1.0, 2.0),
        (
            result.larger_image.unwrap(),
            "large",
            "l",
            300.0,
            400.0,
            3.0,
            4.0,
        ),
        (
            result.raw_image.unwrap(),
            "raw",
            "r",
            500.0,
            600.0,
            5.0,
            6.0,
        ),
    ] {
        assert_eq!(image.url.as_deref(), Some(url));
        assert_eq!(image.cache_key.as_deref(), Some(cache));
        assert_eq!(
            (image.width, image.height, image.x, image.y),
            (Some(width), Some(height), Some(x), Some(y))
        );
    }
    assert!(result.errors.is_empty());
}

#[test]
fn metadata_collections_and_extras_match_go_reader_result_types() {
    let config = serde_json::from_value(json!({
        "selectors": {
            "rating": {"selector": "#rating"},
            "score": {"selector": "#score", "regex": "[0-9.]+", "script": {"type": "javaScript", "source": "Number($arg)/2"}},
            "source": {"selector": "#source", "function": "attribute", "parameter": "href"},
            "uploadTime": {"selector": "time"}, "success": {"selector": "#ok"},
            "tag": {"selector": ".tag"}, "tag.category": {"selector": ".//b", "queryType": "xpath"},
            "badge": {"selector": ".badge"},
            "comment": {"selector": "article"},
            "comment.username": {"selector": ".//b", "queryType": "xpath"},
            "comment.content": {"selector": ".//p", "queryType": "xpath"},
            "comment.time": {"selector": "time"}, "comment.score": {"selector": "i"},
            "comment.avatar.url": {"selector": "img", "function": "attribute", "parameter": "src"},
            "comment.avatar.cacheKey": {"selector": "img", "function": "attribute", "parameter": "data-key"}
        },
        "extras": [
            {"id": "token", "persistent": true, "selector": {"selector": "#token"}},
            {"id": "local", "selector": {"selector": "#missing", "defaultValue": "fallback"}}
        ]
    })).unwrap();
    let result = reader_parser(
        "<span id='rating'>explicit</span><span id='score'>score: 9</span>\
         <a id='source' href='https://source.test/'></a><time>Today</time><b id='ok'>false</b><b id='token'>secret</b>\
         <span class='tag'>Tag<b>group</b></span><span class='badge'>Badge</span>\
         <article><b>Alice</b><p>First</p><time>Now</time><i>+12</i><img src='a.png' data-key='a'></article>\
         <article><b>Bob</b><p>Second</p><time>Later</time><i>-3</i><img src='b.png' data-key='b'></article>",
        &config,
    ).unwrap();
    assert_eq!(result.rating.as_deref(), Some("explicit"));
    assert_eq!(result.score, Some(4.5));
    assert_eq!(result.source.as_deref(), Some("https://source.test/"));
    assert_eq!(result.upload_time.as_deref(), Some("Today"));
    assert_eq!(result.is_success, Some(true));
    assert_eq!(result.tags[0].text.as_deref(), Some("Taggroup"));
    assert_eq!(result.tags[0].category.as_deref(), Some("group"));
    assert_eq!(result.badges[0].text.as_deref(), Some("Badge"));
    assert_eq!(result.comments[0].username.as_deref(), Some("Alice"));
    assert_eq!(result.comments[1].content.as_deref(), Some("Second"));
    assert_eq!(result.comments[1].time.as_deref(), Some("Later"));
    assert_eq!(result.comments[1].score.as_deref(), Some("-3"));
    assert_eq!(
        result.comments[1]
            .avatar
            .as_ref()
            .unwrap()
            .cache_key
            .as_deref(),
        Some("b")
    );
    assert!(result.envs[0].global);
    assert_eq!(result.envs[0].value.as_deref(), Some("secret"));
    assert!(!result.envs[1].global);
    assert_eq!(result.envs[1].value.as_deref(), Some("fallback"));
    assert!(result.errors.is_empty());
}

#[test]
fn broken_optional_fields_keep_other_qualities_and_path_diagnostics() {
    let result = parse(
        "<img src='good.jpg'><i>NaN</i><b id='blocked'>Blocked</b>",
        json!({
            "image.url": {"selector": "img", "function": "attribute", "parameter": "src"},
            "rawImage.url": {"selector": "[[["},
            "largerImage.url": {"selector": "img", "script": {"type": "javaScript", "source": "throw 1"}},
            "image.width": {"selector": "i"}, "score": {"selector": "i"},
            "source": {"selector": "$.source", "queryType": "jsonPath"},
            "tag": {"selector": "[[["}, "comment": {"selector": "[[["},
            "failure": {"selector": "#blocked"}
        }),
    );
    assert_eq!(result.image.unwrap().url.as_deref(), Some("good.jpg"));
    assert!(result.raw_image.unwrap().url.is_none());
    assert!(result.larger_image.unwrap().url.is_none());
    assert_eq!(result.fail_message.as_deref(), Some("Blocked"));
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
        5
    );
    for key in [
        "rawImage.url:",
        "largerImage.url:",
        "image.width:",
        "score:",
        "source:",
        "tag:",
        "comment:",
    ] {
        assert!(
            result.errors.iter().any(|e| e.message.starts_with(key)),
            "missing {key}"
        );
    }
}
