use serde_json::{Value, json};

use super::*;
use crate::errors::{CONVERTER_ERROR, ELEMENT_NOT_FOUND};

fn config(selectors: Value) -> ParserConfig {
    serde_json::from_value(json!({"selectors": selectors})).unwrap()
}

fn parse(html: &str, selectors: Value) -> ListParserResult {
    list_parser(html, &config(selectors)).unwrap()
}

#[test]
fn config_defaults_match_the_current_schema() {
    let config: ParserConfig = serde_json::from_value(json!({
        "extras": [{"id": "token"}],
        "selectors": {"item": {"selector": "li"}}
    }))
    .unwrap();
    let rule = &config.selectors["item"];
    assert_eq!(rule.query_type, SelectorQueryType::Css);
    assert_eq!(
        rule.function,
        crate::models::selector::SelectorFunctionType::Text
    );
    assert_eq!(rule.parameter, "");
    assert!(!config.extras[0].persistent);
    assert!(config.extras[0].selector.is_placeholder());
    assert!(serde_json::from_value::<ParserConfig>(json!({"extras": [{}]})).is_err());
}

#[test]
fn item_query_is_required_and_self_allows_one_item() {
    for selectors in [
        json!({}),
        json!({"item": {}}),
        json!({"item": {"selector": "  "}}),
    ] {
        let error = list_parser("<p>one</p>", &config(selectors)).unwrap_err();
        assert_eq!(error.code, PARSER_ERROR);
        assert!(error.message.starts_with("item:"));
    }
    let result = parse(
        "<p>one</p>",
        json!({
            "item": {"queryType": "self"},
            "title": {"queryType": "self"},
            "tag": {}, "badge": {}, "preview.url": {}
        }),
    );
    assert_eq!(result.items.len(), 1);
    assert_eq!(result.items[0].title.as_deref(), Some("one"));
    assert!(result.items[0].tags.is_empty());
    assert!(result.items[0].badges.is_empty());
    assert_eq!(result.items[0].preview_image, None);
    assert!(result.errors.is_empty());
}

#[test]
fn css_fields_are_relative_to_each_item_in_document_order() {
    let result = parse(
        r#"
        <article><h2>First</h2><small>A</small><a href="/1">link</a><time>today</time><em>EN</em><i>paper A</i></article>
        <article><h2>Second</h2><small>B</small><a href="/2">link</a><time>yesterday</time><em>JP</em><i>paper B</i></article>
    "#,
        json!({
            "item": {"selector": "article"},
            "title": {"selector": "h2"}, "subtitle": {"selector": "small"},
            "idCode": {"selector": "a", "function": "attribute", "parameter": "href"},
            "uploadTime": {"selector": "time"}, "language": {"selector": "em"},
            "paper": {"selector": "i"}
        }),
    );
    assert_eq!(
        result
            .items
            .iter()
            .map(|item| item.title.as_deref())
            .collect::<Vec<_>>(),
        [Some("First"), Some("Second")]
    );
    assert_eq!(result.items[0].subtitle.as_deref(), Some("A"));
    assert_eq!(result.items[1].id_code.as_deref(), Some("/2"));
    assert_eq!(result.items[1].upload_time.as_deref(), Some("yesterday"));
    assert_eq!(result.items[1].language.as_deref(), Some("JP"));
    assert_eq!(result.items[1].paper.as_deref(), Some("paper B"));
    assert!(result.errors.is_empty());
}

#[test]
fn xpath_preserves_relative_absolute_and_union_semantics() {
    let result = parse(
        r#"
        <article><b data-id="one">First</b><span>12 pages</span></article>
        <section><b data-id="two">Second</b><em>34 pages</em></section>
    "#,
        json!({
            "item": {"selector": "//section | //article", "queryType": "xpath"},
            "title": {"selector": ".//b/text()", "queryType": "xpath"},
            "subtitle": {"selector": "//b/text()", "queryType": "xpath"},
            "idCode": {"selector": ".//b/@data-id", "queryType": "xpath"},
            "imageCount": {"selector": ".//span | .//em", "queryType": "xpath", "regex": "\\d+"},
            "rating": {"selector": "count(.//b)", "queryType": "xpath"}
        }),
    );
    assert_eq!(result.items[0].title.as_deref(), Some("First"));
    assert_eq!(result.items[1].title.as_deref(), Some("Second"));
    assert_eq!(result.items[1].subtitle.as_deref(), Some("First"));
    assert_eq!(result.items[1].id_code.as_deref(), Some("two"));
    assert_eq!(result.items[0].image_count, Some(12));
    assert_eq!(result.items[1].image_count, Some(34));
    assert_eq!(result.items[1].star, Some(1.0));
    assert!(result.errors.is_empty());
}

#[test]
fn collections_ignore_extraction_and_transformations() {
    let result = parse(
        "<li><b>A</b></li><li><b>B</b></li>",
        json!({
            "item": {"selector": "li", "function": "attribute", "regex": "(", "script": {"type": "javaScript", "source": "throw 'unused'"}},
            "tag": {"selector": "b", "function": "raw", "regex": "(", "script": {"type": "javaScript", "source": "throw 'unused'"}}
        }),
    );
    assert_eq!(result.items.len(), 2);
    assert_eq!(result.items[1].tags[0].text.as_deref(), Some("B"));
    assert!(result.errors.is_empty());
    let empty = parse("<div></div>", json!({"item": {"selector": "li"}}));
    assert!(empty.items.is_empty());
    assert!(empty.errors.is_empty());
}

#[test]
fn invalid_collection_queries_return_diagnostics_instead_of_panicking() {
    for rule in [
        json!({"selector": "count(//li)", "queryType": "xpath"}),
        json!({"selector": "//li/@id", "queryType": "xpath"}),
        json!({"selector": "//*[", "queryType": "xpath"}),
        json!({"selector": "[[["}),
        json!({"selector": "$.items[*]", "queryType": "jsonPath"}),
    ] {
        let result = parse("<li id='one'>A</li>", json!({"item": rule}));
        assert!(result.items.is_empty());
        assert_eq!(result.errors.len(), 1);
        assert_eq!(result.errors[0].code, PARSER_ERROR);
        assert!(result.errors[0].message.starts_with("item:"));
    }
}

#[test]
fn preview_fields_support_attribute_fallback_and_numeric_values() {
    let result = parse(
        r#"<li><img src="/fallback" data-src="/lazy" width="100.5" height="80" data-x="-12" data-y="4"></li><li><img src="/second" width="20" height="30" data-x="0" data-y="0"></li>"#,
        json!({
            "item": {"selector": "li"},
            "preview.url": {"selector": "img", "function": "attribute", "parameter": " data-src, src "},
            "preview.cacheKey": {"selector": "img", "function": "attribute", "parameter": "src"},
            "preview.width": {"selector": "img", "function": "attribute", "parameter": "width"},
            "preview.height": {"selector": "img", "function": "attribute", "parameter": "height"},
            "preview.x": {"selector": "img", "function": "attribute", "parameter": "data-x"},
            "preview.y": {"selector": "img", "function": "attribute", "parameter": "data-y"}
        }),
    );
    let image = result.items[0].preview_image.as_ref().unwrap();
    assert_eq!(image.url.as_deref(), Some("/lazy"));
    assert_eq!(image.cache_key.as_deref(), Some("/fallback"));
    assert_eq!(
        (image.width, image.height, image.x, image.y),
        (Some(100.5), Some(80.0), Some(-12.0), Some(4.0))
    );
    assert_eq!(
        result.items[1]
            .preview_image
            .as_ref()
            .unwrap()
            .url
            .as_deref(),
        Some("/second")
    );
    assert!(result.errors.is_empty());
}

#[test]
fn nested_tags_and_badges_use_their_own_node_context() {
    let result = parse(
        r#"
        <li><b data-color="red" data-category="a"><span>A</span></b><b data-color="blue" data-category="b"><span>B</span></b><i title="Badge one">ignored</i></li>
        <li><b data-color="green" data-category="c"><span>C</span></b><i title="Badge two">ignored</i></li>
    "#,
        json!({
            "item": {"selector": "li"},
            "tag": {"selector": ".//b", "queryType": "xpath"},
            "tag.text": {"selector": ".//span/text()", "queryType": "xpath"},
            "tag.color": {"queryType": "self", "function": "attribute", "parameter": "data-color"},
            "tag.category": {"selector": "@data-category", "queryType": "xpath"},
            "badge": {"selector": "i"},
            "badge.text": {"function": "attribute", "parameter": "title"}
        }),
    );
    assert_eq!(result.items[0].tags.len(), 2);
    assert_eq!(
        result.items[0].tags[1],
        TagResult {
            text: Some("B".into()),
            color: Some("blue".into()),
            category: Some("b".into())
        }
    );
    assert_eq!(result.items[1].tags[0].text.as_deref(), Some("C"));
    assert_eq!(result.items[1].badges[0].text.as_deref(), Some("Badge two"));
    assert!(result.errors.is_empty());
    let defaults = parse(
        "<li><b>Tag</b><i>Badge</i></li>",
        json!({"item": {"selector": "li"}, "tag": {"selector": "b"}, "tag.text": {}, "badge": {"selector": "i"}}),
    );
    assert_eq!(defaults.items[0].tags[0].text.as_deref(), Some("Tag"));
    assert_eq!(defaults.items[0].badges[0].text.as_deref(), Some("Badge"));
}

#[test]
fn metadata_and_extras_are_read_from_the_page_root() {
    let config: ParserConfig = serde_json::from_value(json!({
        "selectors": {
            "item": {"selector": "li"}, "title": {"queryType": "self"},
            "nextPage": {"selector": "a", "function": "attribute", "parameter": "href"},
            "success": {"selector": "#success"}, "failure": {"selector": "#failure"}
        },
        "extras": [
            {"id": "token", "persistent": true, "selector": {"selector": "#token"}},
            {"id": "local", "selector": {"selector": "#success"}},
            {"id": "missing", "selector": {"selector": "#missing"}}
        ]
    }))
    .unwrap();
    let result = list_parser("<a href='/next'>Next</a><p id='success'>false</p><p id='failure'>message</p><p id='token'>value</p><li>Item</li>", &config).unwrap();
    assert_eq!(result.next_page.as_deref(), Some("/next"));
    assert_eq!(result.is_success, Some(true));
    assert_eq!(result.fail_message.as_deref(), Some("message"));
    assert_eq!(result.items[0].title.as_deref(), Some("Item"));
    assert_eq!(result.envs.len(), 3);
    assert!(result.envs[0].global);
    assert_eq!(result.envs[0].value.as_deref(), Some("value"));
    assert!(!result.envs[1].global);
    assert_eq!(result.envs[2].value, None);
    assert_eq!(result.errors.len(), 1);
    assert!(result.errors[0].message.starts_with("extras[2].missing:"));
    let absent = parse(
        "<li></li>",
        json!({"item": {"selector": "li"}, "success": {"selector": "#missing"}}),
    );
    assert_eq!(absent.is_success, None);
}

#[test]
fn numeric_conversion_errors_keep_other_items_and_fields() {
    let result = parse(
        "<li><b>First</b><i>bad</i><em>9223372036854775808</em></li><li><b>Second</b><i>NaN</i><em>7</em></li><li><b>Third</b><i>4.25</i><em>9</em></li>",
        json!({
            "item": {"selector": "li"}, "title": {"selector": "b"},
            "rating": {"selector": "i"}, "imageCount": {"selector": "em"}
        }),
    );
    assert_eq!(result.items.len(), 3);
    assert_eq!(result.items[0].title.as_deref(), Some("First"));
    assert_eq!(result.items[0].image_count, None);
    assert_eq!(result.items[1].star, None);
    assert_eq!(result.items[1].image_count, Some(7));
    assert_eq!(result.items[2].star, Some(4.25));
    assert_eq!(result.errors.len(), 3);
    assert!(
        result
            .errors
            .iter()
            .all(|error| error.code == CONVERTER_ERROR)
    );
    assert!(
        result
            .errors
            .iter()
            .any(|error| error.message.starts_with("items[0].imageCount:"))
    );
}

#[test]
fn raw_html_and_defaults_preserve_existing_scalar_behavior() {
    let result = parse(
        "<li><b>中文 &amp; text</b></li>",
        json!({
            "item": {"selector": "li"}, "title": {"selector": "b", "function": "raw"},
            "subtitle": {"selector": ".missing", "defaultValue": "fallback"},
            "language": {"selector": "b", "regex": "does not match", "defaultValue": "EN"},
            "paper": {}
        }),
    );
    assert_eq!(
        result.items[0].title.as_deref(),
        Some("<b>中文 &amp; text</b>")
    );
    assert_eq!(result.items[0].subtitle.as_deref(), Some("fallback"));
    assert_eq!(result.items[0].language.as_deref(), Some("EN"));
    assert_eq!(result.items[0].paper, None);
    assert_eq!(result.errors.len(), 1);
    assert_eq!(result.errors[0].code, ELEMENT_NOT_FOUND);
}

#[test]
fn invalid_field_rules_are_local_and_include_field_paths() {
    let result = parse(
        "<li><b>Keep</b></li>",
        json!({
            "item": {"selector": "li"}, "title": {"selector": "b"},
            "subtitle": {"selector": "[[["},
            "language": {"selector": "//*[", "queryType": "xpath"},
            "paper": {"selector": "b", "regex": "("},
            "idCode": {"selector": "b", "script": {"type": "javaScript", "source": "throw 'boom'"}},
            "rating": {"queryType": "jsonPath", "selector": "$.rating"}
        }),
    );
    assert_eq!(result.items[0].title.as_deref(), Some("Keep"));
    assert_eq!(result.errors.len(), 5);
    assert!(
        result
            .errors
            .iter()
            .all(|error| error.code == PARSER_ERROR && error.message.starts_with("items[0]."))
    );
    assert!(
        result
            .errors
            .iter()
            .any(|error| error.message.contains("JSONPath is not supported"))
    );
}

#[test]
fn replacement_tables_match_the_entire_value_and_misses_use_defaults() {
    let result = parse(
        "<li>english</li><li>english text</li><li>unknown</li>",
        json!({
            "item": {"selector": "li"},
            "language": {"queryType": "self", "script": {"type": "replace", "values": {"english": "EN"}}},
            "title": {"queryType": "self", "script": {"type": "replace", "values": {"english": "EN"}}, "defaultValue": "fallback"}
        }),
    );
    assert_eq!(result.items[0].language.as_deref(), Some("EN"));
    assert_eq!(result.items[1].language, None);
    assert_eq!(result.items[2].title.as_deref(), Some("fallback"));
    assert_eq!(result.errors.len(), 4);
    assert!(
        result
            .errors
            .iter()
            .all(|error| error.code == ELEMENT_NOT_FOUND)
    );
}

#[test]
fn javascript_is_isolated_between_fields_items_and_calls() {
    let config = config(json!({
        "item": {"selector": "li"},
        "title": {"queryType": "self", "script": {"type": "javaScript", "source": "globalThis.count = (globalThis.count || 0) + 1; $arg + ':' + count"}},
        "subtitle": {"queryType": "self", "script": {"type": "javaScript", "source": "typeof count"}},
        "language": {"queryType": "self", "script": {"type": "javaScript", "source": "throw 'fail'"}, "defaultValue": "fallback"}
    }));
    for _ in 0..2 {
        let result = list_parser("<li>A</li><li>B</li>", &config).unwrap();
        assert_eq!(result.items[0].title.as_deref(), Some("A:1"));
        assert_eq!(result.items[1].title.as_deref(), Some("B:1"));
        assert!(
            result
                .items
                .iter()
                .all(|item| item.subtitle.as_deref() == Some("undefined")
                    && item.language.as_deref() == Some("fallback"))
        );
        assert_eq!(result.errors.len(), 2);
    }
}

#[test]
fn parses_the_migrated_real_world_fixture() {
    let config: ParserConfig = serde_json::from_str(include_str!(
        "../../../test/parser/testdata/list_parser.json"
    ))
    .unwrap();
    let result = list_parser(
        include_str!("../../../test/parser/testdata/list_html.html"),
        &config,
    )
    .unwrap();
    assert_eq!(result.items.len(), 25);
    let first = &result.items[0];
    let second = &result.items[1];
    assert_eq!(
        first.title.as_deref(),
        Some("Alis Yume cosplay - Savage Arknight")
    );
    assert_eq!(
        second.title.as_deref(),
        Some("[Fanbox] Yusha M September 2024")
    );
    assert_eq!(first.id_code.as_deref(), Some("3099188/0e6cda8513"));
    assert_eq!(second.id_code.as_deref(), Some("3099187/5e5baab875"));
    assert_eq!(first.image_count, Some(18));
    assert_eq!(second.image_count, Some(40));
    assert_eq!(first.star, Some(1.5));
    assert_eq!(second.star, Some(5.0));
    let image = first.preview_image.as_ref().unwrap();
    assert_eq!((image.width, image.height), (Some(250.0), Some(376.0)));
    assert!(
        second
            .preview_image
            .as_ref()
            .unwrap()
            .url
            .as_ref()
            .unwrap()
            .starts_with("https://ehgt.org/4f/2e/")
    );
    assert!(first.tags.iter().any(
        |tag| tag.text.as_deref() == Some("Cosplay") && tag.color.as_deref() == Some("#9030df")
    ));
    assert_eq!(first.badges[0].text.as_deref(), Some("p:arknights"));
    assert_eq!(
        result.next_page.as_deref(),
        Some("https://e-hentai.org/?next=3099159")
    );
    assert_eq!(result.envs.len(), 12);
    assert!(result.envs[0].global);
    assert!(!result.envs[11].global);
    assert_eq!(result.envs[11].value, result.next_page);
    assert!(
        !result
            .errors
            .iter()
            .any(|error| error.code == CONVERTER_ERROR || error.code == PARSER_ERROR)
    );
}
