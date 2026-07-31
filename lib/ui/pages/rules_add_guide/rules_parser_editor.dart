import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/ui/pages/javascript_editor/editor.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_controller.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RulesParserList extends StatelessWidget {
  const RulesParserList({super.key});

  @override
  Widget build(BuildContext context) {
    final editor = context.watch<RulesEditorController>();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        for (final parser in editor.definition.parsers)
          CupertinoCardTile(
            title: Text(parser.name.isEmpty ? parser.id : parser.name),
            subtitle: Text(_kindLabel(parser.kind)),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              onPressed: () => _showMenu(context, parser),
              child: const Icon(Icons.more_horiz_outlined),
            ),
            onTap: () => _openEditor(context, parser),
          ),
        CupertinoCardTile(
          title: const Text('添加'),
          leading: const Icon(Icons.add),
          onTap: () => _createParser(context),
        ),
      ],
    );
  }

  Future<void> _createParser(BuildContext context) async {
    final kind = await showCupertinoSelectDialog<EndpointKind>(
      context: context,
      title: '规则类型',
      cancelText: '取消',
      items: EndpointKind.values.map(
        (value) => SelectTileItem(title: _kindLabel(value), value: value),
      ),
    );
    if (kind == null || !context.mounted) return;
    final name = await showCupertinoInputDialog(context, title: '名称');
    if (name == null || !context.mounted) return;
    final parser = ParserRule(
      id: '${kind.name}-${DateTime.now().microsecondsSinceEpoch}',
      name: name,
      kind: kind,
    );
    await _openEditor(context, parser, isNew: true);
  }

  Future<void> _openEditor(
    BuildContext context,
    ParserRule parser, {
    bool isNew = false,
  }) async {
    final editor = context.read<RulesEditorController>();
    final result = await Navigator.of(context).push<ParserRule>(
      CupertinoPageRoute(builder: (_) => _ParserEditorPage(parser: parser)),
    );
    if (result != null) {
      editor.upsertParser(result, previousId: isNew ? null : parser.id);
    }
  }

  Future<void> _showMenu(BuildContext context, ParserRule parser) async {
    final action = await showCupertinoSelectDialog<_ParserAction>(
      context: context,
      cancelText: '取消',
      items: const [
        SelectTileItem(title: '编辑', value: _ParserAction.edit),
        SelectTileItem(
          title: '删除',
          value: _ParserAction.delete,
          destructive: true,
        ),
      ],
    );
    if (!context.mounted) return;
    switch (action) {
      case null:
        return;
      case _ParserAction.edit:
        await _openEditor(context, parser);
      case _ParserAction.delete:
        final editor = context.read<RulesEditorController>();
        if (!editor.removeParser(parser)) {
          await showCupertinoConfirmDialog(
            context: context,
            content: '无法删除，仍有页面正在使用此解析器。',
            showCancel: false,
          );
        }
    }
  }
}

enum _ParserAction { edit, delete }

class _ParserEditorPage extends StatefulWidget {
  const _ParserEditorPage({required this.parser});

  final ParserRule parser;

  @override
  State<_ParserEditorPage> createState() => _ParserEditorPageState();
}

class _ParserEditorPageState extends State<_ParserEditorPage> {
  late ParserRule parser;

  @override
  void initState() {
    super.initState();
    parser = widget.parser;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('规则'),
        border: const Border(),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          onPressed: () => Navigator.of(context).pop(parser),
          child: const Text('完成'),
        ),
      ),
      child: CupertinoTabBarView(
        tabs: const [CupertinoTab('基础规则'), CupertinoTab('附加字段')],
        children: [_buildSelectorGroups(), _buildExtras()],
      ),
    );
  }

  Widget _buildSelectorGroups() {
    return ListView(
      children: [
        for (final section in _sectionsFor(parser.kind))
          CupertinoListSection.insetGrouped(
            hasLeading: false,
            header: SettingGroupTitle(section.title),
            children: [
              for (final field in section.fields)
                _SelectorTile(
                  title: field.label,
                  selector:
                      parser.config.selectors[field.key] ??
                      const SelectorRule(),
                  onlySelector: field.onlySelector,
                  onChanged: (value) => _updateSelector(field.key, value),
                ),
            ],
          ),
      ],
    );
  }

  Widget _buildExtras() {
    final extras = parser.config.extras;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      children: [
        for (var index = 0; index < extras.length; index++)
          CupertinoCardTile(
            title: Text(extras[index].id),
            subtitle: Text(extras[index].persistent ? '持久化' : '仅当前页面'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              onPressed: () => _deleteExtra(index),
              child: const Icon(
                CupertinoIcons.minus_circle,
                color: CupertinoColors.systemRed,
              ),
            ),
            onTap: () => _editExtra(index),
          ),
        CupertinoCardTile(
          title: const Text('添加规则'),
          leading: const Icon(CupertinoIcons.add),
          onTap: _addExtra,
        ),
      ],
    );
  }

  void _updateSelector(String key, SelectorRule value) {
    setState(() {
      parser = parser.copyWith(
        config: parser.config.copyWith(
          selectors: {...parser.config.selectors, key: value},
        ),
      );
    });
  }

  Future<void> _addExtra() async {
    final id = await showCupertinoInputDialog(context, title: '规则 ID');
    if (id == null || id.trim().isEmpty) return;
    setState(() {
      parser = parser.copyWith(
        config: parser.config.copyWith(
          extras: [
            ...parser.config.extras,
            ExtraSelectorRule(id: id.trim()),
          ],
        ),
      );
    });
  }

  Future<void> _editExtra(int index) async {
    final result = await Navigator.of(context).push<ExtraSelectorRule>(
      CupertinoPageRoute(
        builder: (_) =>
            _ExtraSelectorEditor(extra: parser.config.extras[index]),
      ),
    );
    if (result == null) return;
    setState(() {
      final extras = [...parser.config.extras]..[index] = result;
      parser = parser.copyWith(config: parser.config.copyWith(extras: extras));
    });
  }

  void _deleteExtra(int index) {
    setState(() {
      final extras = [...parser.config.extras]..removeAt(index);
      parser = parser.copyWith(config: parser.config.copyWith(extras: extras));
    });
  }
}

class _SelectorTile extends StatelessWidget {
  const _SelectorTile({
    required this.title,
    required this.selector,
    required this.onChanged,
    required this.onlySelector,
  });

  final String title;
  final SelectorRule selector;
  final ValueChanged<SelectorRule> onChanged;
  final bool onlySelector;

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      title: title,
      onTap: () async {
        final result = await showCupertinoModalSheet<SelectorRule>(
          context: context,
          builder: (_) => _SelectorEditorPage(
            title: title,
            initialValue: selector,
            onlySelector: onlySelector,
          ),
        );
        if (result != null) onChanged(result);
      },
      trailing: selector.isEmpty
          ? const Icon(
              CupertinoIcons.add,
              size: 18,
              color: CupertinoColors.inactiveGray,
            )
          : Icon(
              Icons.edit,
              size: 18,
              color: CupertinoColors.activeGreen.resolveFrom(context),
            ),
    );
  }
}

class _SelectorEditorPage extends StatefulWidget {
  const _SelectorEditorPage({
    required this.title,
    required this.initialValue,
    this.onlySelector = false,
  });

  final String title;
  final SelectorRule initialValue;
  final bool onlySelector;

  @override
  State<_SelectorEditorPage> createState() => _SelectorEditorPageState();
}

class _SelectorEditorPageState extends State<_SelectorEditorPage> {
  late final TextEditingController selectorController;
  late final TextEditingController parameterController;
  late final TextEditingController regexController;
  late final TextEditingController replaceController;
  late final TextEditingController defaultController;
  late final TextEditingController scriptController;
  late SelectorQueryType queryType;
  late SelectorFunctionType function;
  late _ScriptType scriptType;
  late Map<String, String> replacementValues;

  @override
  void initState() {
    super.initState();
    final value = widget.initialValue;
    selectorController = TextEditingController(text: value.selector);
    parameterController = TextEditingController(text: value.parameter);
    regexController = TextEditingController(text: value.regex);
    replaceController = TextEditingController(text: value.replace);
    defaultController = TextEditingController(text: value.defaultValue);
    queryType = value.queryType;
    function = value.function;
    switch (value.script) {
      case OutputSelectorScript():
        scriptType = _ScriptType.output;
        scriptController = TextEditingController();
        replacementValues = {};
      case ReplaceSelectorScript(:final values):
        scriptType = _ScriptType.replace;
        scriptController = TextEditingController();
        replacementValues = Map.of(values);
      case JavaScriptSelectorScript(:final source):
        scriptType = _ScriptType.javaScript;
        scriptController = TextEditingController(text: source);
        replacementValues = {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text('规则: ${widget.title}'),
        transitionBetweenRoutes: false,
        trailing: CupertinoButton(
          padding: const EdgeInsets.only(right: 10),
          minimumSize: Size.zero,
          onPressed: _save,
          child: const Text('保存'),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            CupertinoListSection.insetGrouped(
              hasLeading: false,
              children: [
                _TextSettingRow(label: '选择器', controller: selectorController),
                SettingTile(
                  title: '类型',
                  trailingText: _queryTypeLabel(queryType),
                  onTap: _selectQueryType,
                ),
              ],
            ),
            if (!widget.onlySelector)
              CupertinoListSection.insetGrouped(
                hasLeading: false,
                children: [
                  SettingTile(
                    title: '函数',
                    trailingText: _functionLabel(function),
                    onTap: _selectFunction,
                  ),
                  if (function == SelectorFunctionType.attribute)
                    _TextSettingRow(
                      label: '参数',
                      controller: parameterController,
                    ),
                  _TextSettingRow(label: '正则', controller: regexController),
                  _TextSettingRow(label: '替换', controller: replaceController),
                  _TextSettingRow(label: '默认值', controller: defaultController),
                  SettingTile(
                    title: '脚本',
                    trailingText: _scriptTypeLabel(scriptType),
                    onTap: _selectScriptType,
                  ),
                ],
              ),
            if (!widget.onlySelector && scriptType == _ScriptType.javaScript)
              CupertinoListSection.insetGrouped(
                header: const SettingGroupTitle('JavaScript'),
                hasLeading: false,
                children: [
                  SettingTile(
                    title: '编辑脚本',
                    trailingText: scriptController.text.isEmpty ? '未配置' : '已配置',
                    onTap: _openJavaScriptEditor,
                  ),
                ],
              ),
            if (!widget.onlySelector && scriptType == _ScriptType.replace)
              _ReplacementEditor(
                initialValue: replacementValues,
                onChanged: (value) => replacementValues = value,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectQueryType() async {
    final value = await showCupertinoSelectDialog<SelectorQueryType>(
      context: context,
      selectedValue: queryType,
      items: SelectorQueryType.values.map(
        (value) => SelectTileItem(title: _queryTypeLabel(value), value: value),
      ),
    );
    if (value != null) setState(() => queryType = value);
  }

  Future<void> _selectFunction() async {
    final value = await showCupertinoSelectDialog<SelectorFunctionType>(
      context: context,
      selectedValue: function,
      items: SelectorFunctionType.values.map(
        (value) => SelectTileItem(title: _functionLabel(value), value: value),
      ),
    );
    if (value != null) setState(() => function = value);
  }

  Future<void> _selectScriptType() async {
    final value = await showCupertinoSelectDialog<_ScriptType>(
      context: context,
      selectedValue: scriptType,
      items: _ScriptType.values.map(
        (value) => SelectTileItem(title: _scriptTypeLabel(value), value: value),
      ),
    );
    if (value != null) setState(() => scriptType = value);
  }

  Future<void> _openJavaScriptEditor() async {
    final script = ValueNotifier(scriptController.text);
    await Navigator.of(context).push<void>(
      CupertinoPageRoute(builder: (_) => JavaScriptEditor(script: script)),
    );
    scriptController.text = script.value;
    script.dispose();
    if (mounted) setState(() {});
  }

  void _save() {
    final script = switch (scriptType) {
      _ScriptType.output => const SelectorScript.output(),
      _ScriptType.replace => SelectorScript.replace(values: replacementValues),
      _ScriptType.javaScript => SelectorScript.javaScript(
        source: scriptController.text,
      ),
    };
    Navigator.of(context).pop(
      SelectorRule(
        selector: selectorController.text,
        queryType: queryType,
        function: function,
        parameter: parameterController.text,
        regex: regexController.text,
        replace: replaceController.text,
        defaultValue: defaultController.text,
        script: script,
      ),
    );
  }

  @override
  void dispose() {
    for (final controller in [
      selectorController,
      parameterController,
      regexController,
      replaceController,
      defaultController,
      scriptController,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }
}

class _TextSettingRow extends StatelessWidget {
  const _TextSettingRow({required this.label, required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: CupertinoTextField.borderless(
        controller: controller,
        prefix: SizedBox(
          width: 64,
          child: Text(
            label,
            style: TextStyle(
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              fontSize: 12,
            ),
          ),
        ),
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}

class _ReplacementEditor extends StatefulWidget {
  const _ReplacementEditor({
    required this.initialValue,
    required this.onChanged,
  });

  final Map<String, String> initialValue;
  final ValueChanged<Map<String, String>> onChanged;

  @override
  State<_ReplacementEditor> createState() => _ReplacementEditorState();
}

class _ReplacementEditorState extends State<_ReplacementEditor> {
  late final Map<String, String> values = Map.of(widget.initialValue);

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('替换表'),
      hasLeading: false,
      children: [
        for (final entry in values.entries)
          SettingTile(
            title: entry.key,
            trailingText: entry.value,
            onTap: () => _edit(entry.key, entry.value),
          ),
        SettingTile(title: '添加', icon: CupertinoIcons.add, onTap: _add),
      ],
    );
  }

  Future<void> _add() async {
    final key = await showCupertinoInputDialog(context, title: '匹配值');
    if (key == null || key.isEmpty || !mounted) return;
    final value = await showCupertinoInputDialog(context, title: '替换值');
    if (value == null) return;
    setState(() => values[key] = value);
    widget.onChanged(Map.of(values));
  }

  Future<void> _edit(String key, String current) async {
    final value = await showCupertinoInputDialog(
      context,
      title: '替换值',
      initialValue: current,
    );
    if (value == null) return;
    setState(() => values[key] = value);
    widget.onChanged(Map.of(values));
  }
}

class _ExtraSelectorEditor extends StatefulWidget {
  const _ExtraSelectorEditor({required this.extra});

  final ExtraSelectorRule extra;

  @override
  State<_ExtraSelectorEditor> createState() => _ExtraSelectorEditorState();
}

class _ExtraSelectorEditorState extends State<_ExtraSelectorEditor> {
  late ExtraSelectorRule extra = widget.extra;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(extra.id),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          onPressed: () => Navigator.of(context).pop(extra),
          child: const Text('完成'),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              hasLeading: false,
              children: [
                CupertinoListTile.notched(
                  title: const Text('持久化'),
                  trailing: CupertinoSwitch(
                    value: extra.persistent,
                    onChanged: (value) => setState(
                      () => extra = extra.copyWith(persistent: value),
                    ),
                  ),
                ),
                _SelectorTile(
                  title: '选择器',
                  selector: extra.selector,
                  onlySelector: false,
                  onChanged: (value) =>
                      setState(() => extra = extra.copyWith(selector: value)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _ScriptType { output, replace, javaScript }

class _SelectorSection {
  const _SelectorSection(this.title, this.fields);

  final String title;
  final List<_SelectorField> fields;
}

class _SelectorField {
  const _SelectorField(this.key, this.label, {this.onlySelector = false});

  final String key;
  final String label;
  final bool onlySelector;
}

List<_SelectorSection> _sectionsFor(EndpointKind kind) => switch (kind) {
  EndpointKind.list => _listSections,
  EndpointKind.gallery => _gallerySections,
  EndpointKind.reader => _readerSections,
  EndpointKind.autocomplete => _autocompleteSections,
};

const _listSections = [
  _SelectorSection('基础信息', [_SelectorField('item', '项目选择器')]),
  _SelectorSection('信息设置', [
    _SelectorField('idCode', 'idCode'),
    _SelectorField('title', '标题'),
    _SelectorField('subtitle', '副标题'),
    _SelectorField('uploadTime', '上传时间'),
    _SelectorField('rating', '评分'),
    _SelectorField('imageCount', '面数'),
    _SelectorField('language', '语言'),
  ]),
  _SelectorSection('封面设置', [
    _SelectorField('preview.url', '封面地址'),
    _SelectorField('preview.width', '封面宽度'),
    _SelectorField('preview.height', '封面高度'),
    _SelectorField('preview.x', '封面 X 偏移'),
    _SelectorField('preview.y', '封面 Y 偏移'),
  ]),
  _SelectorSection('标签', [
    _SelectorField('tag.container', '标签选择器', onlySelector: true),
    _SelectorField('tag.text', '标签文本'),
    _SelectorField('tag.category', '标签类型'),
    _SelectorField('tag.color', '标签颜色'),
  ]),
  _SelectorSection('徽章', [
    _SelectorField('badge.container', '徽章选择器', onlySelector: true),
    _SelectorField('badge.text', '徽章文本'),
    _SelectorField('badge.category', '徽章类型'),
    _SelectorField('badge.color', '徽章颜色'),
  ]),
  _SelectorSection('索引', [_SelectorField('nextPage', '下一页地址')]),
  _SelectorSection('标志位', [
    _SelectorField('success', '请求成功'),
    _SelectorField('failure', '请求失败'),
  ]),
];

const _gallerySections = [
  _SelectorSection('基础设置', [
    _SelectorField('title', '标题'),
    _SelectorField('subtitle', '副标题'),
    _SelectorField('uploadTime', '上传时间'),
    _SelectorField('rating', '评分'),
    _SelectorField('language', '语言'),
    _SelectorField('description', '描述'),
    _SelectorField('imageCount', '图片数量'),
    _SelectorField('pageCount', '页数'),
    _SelectorField('countPerPage', '每页图片数'),
  ]),
  _SelectorSection('封面', [
    _SelectorField('cover.url', '封面图片'),
    _SelectorField('cover.width', '封面宽度'),
    _SelectorField('cover.height', '封面高度'),
    _SelectorField('cover.x', '封面 X 偏移'),
    _SelectorField('cover.y', '封面 Y 偏移'),
  ]),
  _SelectorSection('标签', [
    _SelectorField('tag.container', '标签选择器', onlySelector: true),
    _SelectorField('tag.text', '标签内容'),
    _SelectorField('tag.color', '标签颜色'),
    _SelectorField('tag.category', '标签分类'),
  ]),
  _SelectorSection('评论', [
    _SelectorField('comment.container', '评论项目', onlySelector: true),
    _SelectorField('comment.content', '评论内容'),
    _SelectorField('comment.username', '用户名'),
    _SelectorField('comment.time', '评论时间'),
  ]),
  _SelectorSection('缩略图', [
    _SelectorField('thumbnail.container', '缩略图选择器', onlySelector: true),
    _SelectorField('thumbnail.target', '缩略图目标'),
    _SelectorField('thumbnail.url', '缩略图地址'),
    _SelectorField('thumbnail.width', '缩略图宽度'),
    _SelectorField('thumbnail.height', '缩略图高度'),
    _SelectorField('thumbnail.x', '缩略图 X 偏移'),
    _SelectorField('thumbnail.y', '缩略图 Y 偏移'),
  ]),
  _SelectorSection('元数据', [
    _SelectorField('nextPage', '下一页'),
    _SelectorField('success', '成功标志'),
    _SelectorField('failure', '失败标志'),
  ]),
];

const _readerSections = [
  _SelectorSection('图片', [
    _SelectorField('image.url', '图片地址'),
    _SelectorField('image.width', '图片宽度'),
    _SelectorField('image.height', '图片高度'),
    _SelectorField('image.x', '图片 X 偏移'),
    _SelectorField('image.y', '图片 Y 偏移'),
  ]),
  _SelectorSection('图片信息', [
    _SelectorField('id', '图片 ID'),
    _SelectorField('largerImage', '大图地址'),
    _SelectorField('rawImage', '原图地址'),
    _SelectorField('rating', '级别'),
    _SelectorField('score', '评分'),
    _SelectorField('source', '来源'),
    _SelectorField('uploadTime', '上传时间'),
  ]),
  _SelectorSection('标签', [
    _SelectorField('tag.container', '标签项目'),
    _SelectorField('tag.text', '标签内容'),
    _SelectorField('tag.category', '标签类型'),
    _SelectorField('tag.color', '标签颜色'),
  ]),
];

const _autocompleteSections = [
  _SelectorSection('基础信息', [
    _SelectorField('item', '项目选择器'),
    _SelectorField('title', '标题'),
    _SelectorField('subtitle', '副标题'),
    _SelectorField('complete', '补全内容'),
    _SelectorField('success', '请求成功'),
    _SelectorField('failure', '请求失败'),
  ]),
];

String _kindLabel(EndpointKind kind) => switch (kind) {
  EndpointKind.list => '列表页',
  EndpointKind.gallery => '详情页',
  EndpointKind.reader => '图片页',
  EndpointKind.autocomplete => '补全页',
};

String _queryTypeLabel(SelectorQueryType type) => switch (type) {
  SelectorQueryType.self => 'self',
  SelectorQueryType.css => 'css',
  SelectorQueryType.xpath => 'xpath',
  SelectorQueryType.jsonPath => 'jsonPath',
};

String _functionLabel(SelectorFunctionType type) => switch (type) {
  SelectorFunctionType.text => 'text',
  SelectorFunctionType.attribute => 'attr',
  SelectorFunctionType.raw => 'raw',
};

String _scriptTypeLabel(_ScriptType type) => switch (type) {
  _ScriptType.output => '输出',
  _ScriptType.replace => '替换',
  _ScriptType.javaScript => 'Js脚本',
};
