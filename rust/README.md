# HTML 列表解析

Rust 入口为 `parser::list_parser(&str, &ParserConfig)`，Flutter 入口为
`lib/src/rust/api/parser.dart` 的 `parseList(html: ..., config: ...)`。
调用 Flutter 接口前需要初始化 `RustLib`。参数和返回值使用 FRB 生成的类型，
与 `data/site_runtime` 的规则模型、现有 Dart 业务结果模型分别独立。
Flutter 的 `RustParserEngine` 已接入站点默认会话和列表页面，负责规则与结果模型
转换、分页信息、环境补丁和失败处理。当前支持 HTML 列表和搜索结果，详情、阅读器
及自动补全端点会明确返回尚未实现的解析错误。

结果模型通过 Rust 结构体上的 `frb(dart_metadata = ("freezed"))` 标记生成
Freezed 类型，支持 `copyWith`、集合深度比较和只读集合。重新生成时应同时
生成 `result.freezed.dart` 和 `selector.freezed.dart`。

配置使用当前 `ParserConfig` 格式，键名对应 `ParserSelectorKey`。
`item` 必填；单条记录可显式使用 `self`。条目字段的 XPath 使用标准语义：
`//` 从整页查询，`.//` 相对当前条目查询。`tag`、`badge` 查询各自的集合，
其 `.text`、`.color`、`.category` 字段相对集合节点执行；文本未配置时读取自身。
预览图使用 `preview.url`、`preview.cacheKey`、`preview.width`、
`preview.height`、`preview.x`、`preview.y`；评分键 `rating` 返回为 `star`。

当前仅支持 HTML，不兼容旧 Go JSON 配置。字符串字段依次执行提取、正则和脚本，
之后再进行数值转换。替换表按完整值匹配，JavaScript 每次使用独立上下文，
以 `$arg` 接收输入。字段错误保留在结果的 `errors` 中，包含字段路径；
缺少 `item` 属于顶层错误。extras 仅返回提取结果，不提交环境更新。

```powershell
# Rust 验证
cargo test --locked --manifest-path rust/Cargo.toml
cargo clippy --locked --manifest-path rust/Cargo.toml --all-targets -- -D warnings
cargo fmt --manifest-path rust/Cargo.toml -- --check

# FRB 绑定（生成器须与依赖保持 2.13.0）
flutter_rust_bridge_codegen generate --no-build-runner --no-auto-upgrade-dependency --stop-on-error
dart run build_runner build
cargo fmt --manifest-path rust/Cargo.toml

# 包含真实动态库调用；测试自动执行 cargo build --locked
flutter test test/parser
```

`test/parser/testdata/list_parser.json` 是从旧配置迁移的新格式样例，
复用原 HTML 验证 25 条记录的解析。真实桥接测试可参考
`test/parser/rust_list_parser_test.dart`，其中展示了强类型配置与嵌套结果。
