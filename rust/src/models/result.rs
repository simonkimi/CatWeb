use serde::{Deserialize, Serialize};

use crate::errors::ParseError;

#[derive(Debug, Clone, Default, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[flutter_rust_bridge::frb(dart_metadata = ("freezed"))]
pub struct ImageResult {
    pub url: Option<String>,
    pub cache_key: Option<String>,
    pub width: Option<f64>,
    pub height: Option<f64>,
    pub x: Option<f64>,
    pub y: Option<f64>,
}

#[derive(Debug, Clone, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[flutter_rust_bridge::frb(dart_metadata = ("freezed"))]
pub struct TagResult {
    pub text: Option<String>,
    pub color: Option<String>,
    pub category: Option<String>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[flutter_rust_bridge::frb(dart_metadata = ("freezed"))]
pub struct EnvResult {
    pub id: String,
    pub global: bool,
    pub value: Option<String>,
}

#[derive(Debug, Clone, Default, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[flutter_rust_bridge::frb(dart_metadata = ("freezed"))]
pub struct ListParserResultItem {
    pub title: Option<String>,
    pub subtitle: Option<String>,
    pub upload_time: Option<String>,
    pub star: Option<f64>,
    pub image_count: Option<i64>,
    pub preview_image: Option<ImageResult>,
    pub badges: Vec<TagResult>,
    pub tags: Vec<TagResult>,
    pub language: Option<String>,
    pub id_code: Option<String>,
    pub paper: Option<String>,
}

#[derive(Debug, Clone, Default, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[flutter_rust_bridge::frb(dart_metadata = ("freezed"))]
pub struct ListParserResult {
    pub items: Vec<ListParserResultItem>,
    pub next_page: Option<String>,
    pub is_success: Option<bool>,
    pub fail_message: Option<String>,
    pub envs: Vec<EnvResult>,
    pub errors: Vec<ParseError>,
}

#[derive(Debug, Clone, Default, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[flutter_rust_bridge::frb(dart_metadata = ("freezed"))]
pub struct CommentResult {
    pub username: Option<String>,
    pub content: Option<String>,
    pub time: Option<String>,
    pub score: Option<String>,
    pub avatar: Option<ImageResult>,
}

#[derive(Debug, Clone, Default, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[flutter_rust_bridge::frb(dart_metadata = ("freezed"))]
pub struct GalleryPreviewItem {
    pub preview_image: Option<ImageResult>,
    pub target: Option<String>,
}

#[derive(Debug, Clone, Default, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
#[flutter_rust_bridge::frb(dart_metadata = ("freezed"))]
pub struct GalleryParserResult {
    pub title: Option<String>,
    pub subtitle: Option<String>,
    pub language: Option<String>,
    pub upload_time: Option<String>,
    pub description: Option<String>,
    pub star: Option<f64>,
    pub image_count: Option<i64>,
    pub page_count: Option<i64>,
    pub count_per_page: Option<i64>,
    pub cover_image: Option<ImageResult>,
    pub previews: Vec<GalleryPreviewItem>,
    pub tags: Vec<TagResult>,
    pub badges: Vec<TagResult>,
    pub comments: Vec<CommentResult>,
    pub next_page: Option<String>,
    pub is_success: Option<bool>,
    pub fail_message: Option<String>,
    pub envs: Vec<EnvResult>,
    pub errors: Vec<ParseError>,
}
