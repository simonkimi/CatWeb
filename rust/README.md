# HTML 列表、画廊与阅读器解析

Rust 入口为 `parser::list_parser(&str, &ParserConfig)`，Flutter 入口为
`lib/src/rust/api/parser.dart` 的 `parseList(html: ..., config: ...)`。
调用 Flutter 接口前需要初始化 `RustLib`。参数和返回值使用 FRB 生成的类型，
与 `data/site_runtime` 的规则模型、现有 Dart 业务结果模型分别独立。
Flutter 的 `RustParserEngine` 已接入站点默认会话和列表页面，负责规则与结果模型
转换、分页信息、环境补丁和失败处理。画廊入口为
`parser::gallery_parser(&str, &ParserConfig)` / `parseGallery(html: ..., config: ...)`，
已接入 Flutter 画廊详情、预览分页和评论。阅读器入口为
`parser::reader_parser(&str, &ParserConfig)` / `parseReader(html: ..., config: ...)`，
返回 `ImageReaderResult`，已接入 Flutter 阅读页加载器。自动补全仍未实现。

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
缺少 `item` 属于顶层错误。Rust 仅返回 extras 提取结果，Flutter 执行器在验证
成功后提交环境更新。

画廊的 `cover.*` 解析封面，`thumbnail` 定位缩略图，`thumbnail.target` 提供
阅读目标，`thumbnail.*` 提取图片和雪碧图尺寸／偏移；`comment` 定位评论，
支持 `comment.content`、`comment.username`、`comment.time`、字符串
`comment.score` 和 `comment.avatar.*`。所有图片支持 `.cacheKey`。
缺少缩略图配置时只展示元数据；缺图或缺目标的条目保留原位置，UI 显示占位。
缩略图集合的查询错误会使页面失败；其他字段诊断保留在 `errors`。

画廊 `imageCount` 映射为分页总图片数，`pageCount` 仅是页面总数元数据；
`countPerPage` 映射到业务模型既有的 `countPrePage`，不覆盖端点
`pagination.pageSize`，随机索引始终按端点配置计算。模板支持
普通、大图及雪碧图缩略图；模板更新不迁移已有站点规则。

阅读器使用 `image.*`、`largerImage.*`、`rawImage.*` 三组图片字段，每组均支持
`url/cacheKey/width/height/x/y`。`rating` 是级别字符串，`score` 是数值评分；
另支持 `source`、`uploadTime`、`tag.*`、`badge.*`、`comment.*`、成功／失败标志
和 extras。评论头像同样支持缓存键和尺寸／偏移。页面元数据只解析返回，
本次未增加阅读器信息面板。

Rust 保留可选字段错误和部分结果；Flutter 在失败标志命中、有效成功规则未命中，
或三种图片均无非空 URL 时拒绝页面，环境补丁不提交。字段错误不会阻止其他画质
加载。默认画质依次尝试普通图／大图／原图，大图画质依次尝试大图／普通图／原图，
原图画质依次尝试原图／大图／普通图；URL 为空的对象会跳过。
阅读器结果为单页，`itemCount=1`、`isLast=true`，没有 continuation。
阅读页解析失败可手动重试，重试强制重新获取文档，避免继续使用失败页面的缓存。

新模板和编辑器仅使用完整图片字段；裸键 `largerImage`、`rawImage` 不作为 URL
别名解析。Schema 仍为 v2，不自动迁移已保存规则，需要手动改键或重新创建站点。

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
flutter test test/site_runtime test/ui/gallery_test.dart
flutter test test/ui/rules_edit_page_test.dart test/ui/rules_editor_controller_test.dart
```

真实桥接测试可参考 `test/parser/rust_list_parser_test.dart`，其中展示了强类型配置
与嵌套结果。解析测试直接内嵌 HTML 和规则，不依赖外部测试样例文件。
