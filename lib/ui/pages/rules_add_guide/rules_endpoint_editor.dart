import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/ui/pages/javascript_editor/editor.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_form_fields.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:catweb/utils/icons.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum _EndpointAction { edit, delete }

class RulesEndpointList extends StatelessWidget {
  const RulesEndpointList({super.key});

  @override
  Widget build(BuildContext context) {
    final editor = context.watch<RulesEditorController>();
    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 28),
      children: [
        for (final endpoint in editor.definition.endpoints)
          CupertinoCardTile(
            leading: Icon(
              cupertinoIcons[endpoint.icon] ?? _kindIcon(endpoint.kind),
            ),
            title: Text(endpoint.name),
            subtitle: Text('${_kindLabel(endpoint.kind)} · ${endpoint.id}'),
            trailing: const Icon(Icons.more_horiz_outlined),
            onTrailingTap: () => _showMenu(context, endpoint),
            onTap: () => _openEditor(context, endpoint),
          ),
        CupertinoCardTile(
          leading: const Icon(CupertinoIcons.add),
          title: const Text('添加'),
          onTap: () => _createEndpoint(context),
        ),
      ],
    );
  }

  Future<void> _openEditor(BuildContext context, EndpointRule? endpoint) async {
    final editor = context.read<RulesEditorController>();
    final result = await Navigator.of(context).push<EndpointRule>(
      CupertinoPageRoute(
        builder: (_) => RulesEndpointEditorPage(
          endpoint: endpoint,
          parsers: editor.definition.parsers,
          endpoints: editor.definition.endpoints,
        ),
      ),
    );
    if (result != null) {
      editor.upsertEndpoint(result, previousId: endpoint?.id);
    }
  }

  Future<void> _createEndpoint(BuildContext context) async {
    final name = await showCupertinoInputDialog(context, title: '名称');
    if (name == null || !context.mounted) return;
    final kind = await showCupertinoSelectDialog<EndpointKind>(
      context: context,
      title: '选择模板',
      cancelText: '取消',
      items: EndpointKind.values.map(
        (value) => SelectTileItem(title: _kindLabel(value), value: value),
      ),
    );
    if (kind == null || !context.mounted) return;
    final editor = context.read<RulesEditorController>();
    final parser = editor.definition.parsers
        .where((parser) => parser.kind == kind)
        .firstOrNull;
    if (parser == null) {
      await showCupertinoConfirmDialog(
        context: context,
        content: '请先添加对应类型的解析器。',
        showCancel: false,
      );
      return;
    }
    final id = '${kind.name}-${DateTime.now().microsecondsSinceEpoch}';
    final endpoint = EndpointRule(
      id: id,
      kind: kind,
      name: name,
      request: const RequestRule(method: RequestMethod.get, url: '/'),
      parserId: parser.id,
      pagination: kind == EndpointKind.list || kind == EndpointKind.gallery
          ? const PaginationRule.pageNumber(
              variable: 'page',
              initial: 0,
              step: 1,
              pageSize: 20,
              endCondition: PageEndCondition.emptyItems,
            )
          : const PaginationRule.none(),
    );
    await _openEditor(context, endpoint);
  }

  Future<void> _delete(BuildContext context, EndpointRule endpoint) async {
    final confirmed = await showCupertinoConfirmDialog(
      context: context,
      title: '删除页面',
      content: '确定删除“${endpoint.name}”吗？',
      confineText: '删除',
      confineTextColor: CupertinoColors.systemRed,
    );
    if (confirmed == true && context.mounted) {
      context.read<RulesEditorController>().removeEndpoint(endpoint);
    }
  }

  Future<void> _showMenu(BuildContext context, EndpointRule endpoint) async {
    final action = await showCupertinoSelectDialog<_EndpointAction>(
      context: context,
      cancelText: '取消',
      items: const [
        SelectTileItem(title: '编辑', value: _EndpointAction.edit),
        SelectTileItem(
          title: '删除',
          value: _EndpointAction.delete,
          destructive: true,
        ),
      ],
    );
    if (!context.mounted) return;
    switch (action) {
      case null:
        return;
      case _EndpointAction.edit:
        await _openEditor(context, endpoint);
      case _EndpointAction.delete:
        await _delete(context, endpoint);
    }
  }
}

class RulesEndpointEditorPage extends StatefulWidget {
  const RulesEndpointEditorPage({
    required this.endpoint,
    required this.parsers,
    required this.endpoints,
    super.key,
  });

  final EndpointRule? endpoint;
  final List<ParserRule> parsers;
  final List<EndpointRule> endpoints;

  @override
  State<RulesEndpointEditorPage> createState() =>
      _RulesEndpointEditorPageState();
}

enum _BodyType { none, form, text, json }

enum _PaginationType { none, pageNumber, continuation }

class _RulesEndpointEditorPageState extends State<RulesEndpointEditorPage> {
  late final TextEditingController idController;
  late final TextEditingController nameController;
  late final TextEditingController urlController;
  late final TextEditingController bodyTextController;
  late final TextEditingController pageVariableController;
  late final TextEditingController pageInitialController;
  late final TextEditingController pageStepController;
  late final TextEditingController pageSizeController;
  late final TextEditingController continuationVariableController;
  late final TextEditingController responseFieldController;
  late final TextEditingController autocompleteSplitController;
  late final TextEditingController autocompleteTimeoutController;

  late EndpointKind kind;
  late String icon;
  late bool visible;
  late RequestMethod method;
  late String parserId;
  late EndpointCachePolicy cachePolicy;
  late bool idempotent;
  late Map<String, Object?> query;
  late Map<String, Object?> headers;
  late _BodyType bodyType;
  late Map<String, Object?> bodyFields;
  late _PaginationType paginationType;
  late PageEndCondition endCondition;
  late ContinuationTarget continuationTarget;
  late EndpointPresentation presentation;
  String? itemLink;
  String? autocompleteLink;
  String? readerLink;

  @override
  void initState() {
    super.initState();
    final endpoint = widget.endpoint;
    final request = endpoint?.request;
    idController = TextEditingController(text: endpoint?.id ?? '');
    nameController = TextEditingController(text: endpoint?.name ?? '');
    urlController = TextEditingController(text: request?.url ?? '');
    kind = endpoint?.kind ?? EndpointKind.list;
    icon = endpoint?.icon ?? '';
    visible = endpoint?.visible ?? true;
    method = request?.method ?? RequestMethod.get;
    parserId =
        endpoint?.parserId ??
        (widget.parsers.isEmpty ? '' : widget.parsers.first.id);
    cachePolicy = endpoint?.cachePolicy ?? EndpointCachePolicy.networkFirst;
    idempotent = request?.idempotent ?? false;
    query = Map.of(request?.query ?? const {});
    headers = Map.of(request?.headers ?? const {});

    final body = request?.body ?? const RequestBodyRule.none();
    switch (body) {
      case NoRequestBodyRule():
        bodyType = _BodyType.none;
        bodyFields = {};
        bodyTextController = TextEditingController();
      case FormRequestBodyRule(:final fields):
        bodyType = _BodyType.form;
        bodyFields = Map.of(fields);
        bodyTextController = TextEditingController();
      case TextRequestBodyRule(:final value):
        bodyType = _BodyType.text;
        bodyFields = {};
        bodyTextController = TextEditingController(text: value);
      case JsonRequestBodyRule(:final value):
        bodyType = _BodyType.json;
        bodyFields = value is Map
            ? value.map((key, value) => MapEntry(key.toString(), value))
            : {'value': value};
        bodyTextController = TextEditingController();
    }

    final pagination = endpoint?.pagination ?? const PaginationRule.none();
    switch (pagination) {
      case NoPaginationRule():
        paginationType = _PaginationType.none;
        pageVariableController = TextEditingController(text: 'page');
        pageInitialController = TextEditingController(text: '0');
        pageStepController = TextEditingController(text: '1');
        pageSizeController = TextEditingController(text: '20');
        endCondition = PageEndCondition.emptyItems;
        continuationTarget = ContinuationTarget.url;
        continuationVariableController = TextEditingController();
        responseFieldController = TextEditingController(text: 'continuation');
      case PageNumberPaginationRule(
        :final variable,
        :final initial,
        :final step,
        :final pageSize,
        :final endCondition,
      ):
        paginationType = _PaginationType.pageNumber;
        pageVariableController = TextEditingController(text: variable);
        pageInitialController = TextEditingController(text: '$initial');
        pageStepController = TextEditingController(text: '$step');
        pageSizeController = TextEditingController(text: '$pageSize');
        this.endCondition = endCondition;
        continuationTarget = ContinuationTarget.url;
        continuationVariableController = TextEditingController();
        responseFieldController = TextEditingController(text: 'continuation');
      case ContinuationPaginationRule(
        :final target,
        :final variable,
        :final responseField,
      ):
        paginationType = _PaginationType.continuation;
        pageVariableController = TextEditingController(text: 'page');
        pageInitialController = TextEditingController(text: '0');
        pageStepController = TextEditingController(text: '1');
        pageSizeController = TextEditingController(text: '20');
        endCondition = PageEndCondition.missingContinuation;
        continuationTarget = target;
        continuationVariableController = TextEditingController(
          text: variable ?? '',
        );
        responseFieldController = TextEditingController(text: responseField);
    }

    itemLink = endpoint?.links.item;
    autocompleteLink = endpoint?.links.autocomplete;
    readerLink = endpoint?.links.reader;
    presentation = endpoint?.presentation ?? const EndpointPresentation();
    autocompleteSplitController = TextEditingController(
      text: presentation.autocompleteSplitChar,
    );
    autocompleteTimeoutController = TextEditingController(
      text: '${presentation.autocompleteTimeout}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('页面'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          onPressed: _save,
          child: const Text('完成'),
        ),
      ),
      child: CupertinoTabBarView(
        tabs: [
          const CupertinoTab('基础'),
          if (kind == EndpointKind.list) ...const [
            CupertinoTab('子页面'),
            CupertinoTab('筛选'),
          ],
          if (kind == EndpointKind.autocomplete) const CupertinoTab('设置'),
        ],
        children: [
          RuleFormPage(
            children: [
              const RuleSectionTitle('基本信息'),
              RuleTextField(label: '页面 ID', controller: idController),
              RuleTextField(label: '显示名称', controller: nameController),
              RuleSelectField(
                label: '页面类型',
                value: _kindLabel(kind),
                onPressed: () => _selectEnum(
                  values: EndpointKind.values,
                  selected: kind,
                  label: _kindLabel,
                  onSelected: (value) => kind = value,
                ),
              ),
              RuleSelectField(
                label: '图标',
                value: icon.isEmpty ? '默认图标' : icon,
                onPressed: _selectIcon,
              ),
              RuleSwitchField(
                label: '在导航中显示',
                value: visible,
                onChanged: (value) => setState(() => visible = value),
              ),
              const RuleSectionTitle('请求'),
              RuleSelectField(
                label: '请求方法',
                value: method.name.toUpperCase(),
                onPressed: () => _selectEnum(
                  values: RequestMethod.values,
                  selected: method,
                  label: (value) => value.name.toUpperCase(),
                  onSelected: (value) => method = value,
                ),
              ),
              RuleTextField(label: 'URL', controller: urlController),
              RuleSelectField(
                label: '解析器',
                value: parserId.isEmpty ? '未选择' : parserId,
                onPressed: _selectParser,
              ),
              RuleSelectField(
                label: '缓存策略',
                value: _cacheLabel(cachePolicy),
                onPressed: () => _selectEnum(
                  values: EndpointCachePolicy.values,
                  selected: cachePolicy,
                  label: _cacheLabel,
                  onSelected: (value) => cachePolicy = value,
                ),
              ),
              RuleSwitchField(
                label: '允许自动重试非 GET 请求',
                value: idempotent,
                onChanged: (value) => setState(() => idempotent = value),
              ),
              RuleKeyValueEditor(
                label: '查询参数',
                initialValue: query,
                onChanged: (value) => query = value,
              ),
              RuleKeyValueEditor(
                label: '请求头',
                initialValue: headers,
                onChanged: (value) => headers = value,
              ),
              const RuleSectionTitle('请求体'),
              RuleSelectField(
                label: '请求体类型',
                value: _bodyLabel(bodyType),
                onPressed: () => _selectEnum(
                  values: _BodyType.values,
                  selected: bodyType,
                  label: _bodyLabel,
                  onSelected: (value) => bodyType = value,
                ),
              ),
              if (bodyType == _BodyType.form || bodyType == _BodyType.json)
                RuleKeyValueEditor(
                  key: ValueKey(bodyType),
                  label: bodyType == _BodyType.form ? '表单字段' : '对象字段',
                  initialValue: bodyFields,
                  onChanged: (value) => bodyFields = value,
                ),
              if (bodyType == _BodyType.text)
                RuleTextField(
                  label: '文本内容',
                  controller: bodyTextController,
                  maxLines: 4,
                ),
              const RuleSectionTitle('分页'),
              RuleSelectField(
                label: '分页方式',
                value: _paginationLabel(paginationType),
                onPressed: () => _selectEnum(
                  values: _PaginationType.values,
                  selected: paginationType,
                  label: _paginationLabel,
                  onSelected: (value) => paginationType = value,
                ),
              ),
              if (paginationType == _PaginationType.pageNumber) ...[
                RuleTextField(
                  label: '页码变量',
                  controller: pageVariableController,
                ),
                RuleTextField(
                  label: '初始页码',
                  controller: pageInitialController,
                  keyboardType: TextInputType.number,
                ),
                RuleTextField(
                  label: '递增步长',
                  controller: pageStepController,
                  keyboardType: TextInputType.number,
                ),
                RuleTextField(
                  label: '每页数量',
                  controller: pageSizeController,
                  keyboardType: TextInputType.number,
                ),
                RuleSelectField(
                  label: '结束条件',
                  value: _endConditionLabel(endCondition),
                  onPressed: () => _selectEnum(
                    values: PageEndCondition.values,
                    selected: endCondition,
                    label: _endConditionLabel,
                    onSelected: (value) => endCondition = value,
                  ),
                ),
              ],
              if (paginationType == _PaginationType.continuation) ...[
                RuleSelectField(
                  label: '续页值用途',
                  value: _continuationTargetLabel(continuationTarget),
                  onPressed: () => _selectEnum(
                    values: ContinuationTarget.values,
                    selected: continuationTarget,
                    label: _continuationTargetLabel,
                    onSelected: (value) => continuationTarget = value,
                  ),
                ),
                if (continuationTarget == ContinuationTarget.variable)
                  RuleTextField(
                    label: '续页变量',
                    controller: continuationVariableController,
                  ),
                RuleTextField(
                  label: '响应字段',
                  controller: responseFieldController,
                ),
              ],
              const RuleSectionTitle('页面关联'),
              _linkField('条目详情页', itemLink, (value) => itemLink = value),
              _linkField(
                '自动补全页',
                autocompleteLink,
                (value) => autocompleteLink = value,
              ),
              _linkField('阅读器页', readerLink, (value) => readerLink = value),
            ],
          ),
          if (kind == EndpointKind.list) _buildSubpages(),
          if (kind == EndpointKind.list) _buildFilters(),
          if (kind == EndpointKind.autocomplete) _buildAutocompleteSettings(),
        ],
      ),
    );
  }

  Widget _buildSubpages() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        for (final entry in presentation.subpages.asMap().entries)
          CupertinoCardTile(
            title: Text(entry.value.name),
            subtitle: Text(
              entry.value.key.isEmpty
                  ? '默认页面'
                  : '{ ${entry.value.key}: ${entry.value.value} }',
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              onPressed: () => _removeSubpage(entry.key),
              child: const Icon(
                CupertinoIcons.minus_circle,
                color: CupertinoColors.systemRed,
              ),
            ),
            onTap: () => _editSubpage(entry.key, entry.value),
          ),
        CupertinoCardTile(
          title: const Text('添加'),
          leading: const Icon(CupertinoIcons.add),
          onTap: () => _editSubpage(null, const EndpointSubpage()),
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        CupertinoListSection.insetGrouped(
          hasLeading: false,
          children: [
            SettingTile(
              title: '脚本',
              trailingText:
                  presentation.filterScript is JavaScriptSelectorScript
                  ? '已配置'
                  : '未配置',
              onTap: _editFilterScript,
            ),
          ],
        ),
        for (final entry in presentation.filters.asMap().entries)
          CupertinoCardTile(
            title: Text(entry.value.name),
            subtitle: Text(
              '${entry.value.key} · ${_filterTypeLabel(entry.value.type)}',
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              onPressed: () => _removeFilter(entry.key),
              child: const Icon(
                CupertinoIcons.minus_circle,
                color: CupertinoColors.systemRed,
              ),
            ),
            onTap: () => _editFilter(entry.key, entry.value),
          ),
        CupertinoCardTile(
          title: const Text('添加'),
          leading: const Icon(CupertinoIcons.add),
          onTap: () => _editFilter(null, const EndpointFilter()),
        ),
      ],
    );
  }

  Widget _buildAutocompleteSettings() {
    return RuleFormPage(
      children: [
        RuleTextField(label: '分隔符', controller: autocompleteSplitController),
        RuleTextField(
          label: '开始搜索时间',
          controller: autocompleteTimeoutController,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Future<void> _editSubpage(int? index, EndpointSubpage initial) async {
    final value = await showCupertinoDialog<EndpointSubpage>(
      context: context,
      builder: (_) => _SubpageDialog(initialValue: initial),
    );
    if (value == null) return;
    setState(() {
      final items = [...presentation.subpages];
      index == null ? items.add(value) : items[index] = value;
      presentation = presentation.copyWith(subpages: items);
    });
  }

  void _removeSubpage(int index) {
    setState(() {
      final items = [...presentation.subpages]..removeAt(index);
      presentation = presentation.copyWith(subpages: items);
    });
  }

  Future<void> _editFilter(int? index, EndpointFilter initial) async {
    final value = await showCupertinoDialog<EndpointFilter>(
      context: context,
      builder: (_) => _FilterDialog(initialValue: initial),
    );
    if (value == null) return;
    setState(() {
      final items = [...presentation.filters];
      index == null ? items.add(value) : items[index] = value;
      presentation = presentation.copyWith(filters: items);
    });
  }

  void _removeFilter(int index) {
    setState(() {
      final items = [...presentation.filters]..removeAt(index);
      presentation = presentation.copyWith(filters: items);
    });
  }

  Future<void> _editFilterScript() async {
    final source = switch (presentation.filterScript) {
      JavaScriptSelectorScript(:final source) => source,
      _ => '',
    };
    final notifier = ValueNotifier(source);
    await Navigator.of(context).push<void>(
      CupertinoPageRoute(builder: (_) => JavaScriptEditor(script: notifier)),
    );
    setState(() {
      presentation = presentation.copyWith(
        filterScript: SelectorScript.javaScript(source: notifier.value),
      );
    });
    notifier.dispose();
  }

  RuleSelectField _linkField(
    String label,
    String? value,
    ValueChanged<String?> onSelected,
  ) {
    return RuleSelectField(
      label: label,
      value: value ?? '无',
      onPressed: () => _selectLink(value, onSelected),
    );
  }

  Future<void> _selectIcon() async {
    final selected = await showCupertinoIconDialog(context);
    if (selected != null) setState(() => icon = selected);
  }

  Future<void> _selectParser() async {
    if (widget.parsers.isEmpty) {
      await _showError('请先添加解析器');
      return;
    }
    final selected = await showCupertinoSelectDialog<String>(
      context: context,
      selectedValue: parserId,
      cancelText: '取消',
      items: widget.parsers.map(
        (parser) => SelectTileItem(title: parser.id, value: parser.id),
      ),
    );
    if (selected != null) setState(() => parserId = selected);
  }

  Future<void> _selectLink(
    String? selectedValue,
    ValueChanged<String?> onSelected,
  ) async {
    final selected = await showCupertinoSelectDialog<String>(
      context: context,
      selectedValue: selectedValue ?? '',
      cancelText: '取消',
      items: [
        const SelectTileItem(title: '无', value: ''),
        ...widget.endpoints
            .where((endpoint) => endpoint.id != widget.endpoint?.id)
            .map(
              (endpoint) => SelectTileItem(
                title: '${endpoint.name} (${endpoint.id})',
                value: endpoint.id,
              ),
            ),
      ],
    );
    if (selected != null) {
      setState(() => onSelected(selected.isEmpty ? null : selected));
    }
  }

  Future<void> _selectEnum<T>({
    required List<T> values,
    required T selected,
    required String Function(T) label,
    required ValueChanged<T> onSelected,
  }) async {
    final result = await showCupertinoSelectDialog<T>(
      context: context,
      selectedValue: selected,
      cancelText: '取消',
      items: values.map(
        (value) => SelectTileItem(title: label(value), value: value),
      ),
    );
    if (result != null) setState(() => onSelected(result));
  }

  Future<void> _save() async {
    final id = idController.text.trim();
    final name = nameController.text.trim();
    if (id.isEmpty || name.isEmpty || urlController.text.trim().isEmpty) {
      await _showError('页面 ID、显示名称和 URL 不能为空');
      return;
    }
    if (id != widget.endpoint?.id &&
        widget.endpoints.any((endpoint) => endpoint.id == id)) {
      await _showError('页面 ID 已存在');
      return;
    }
    if (parserId.isEmpty) {
      await _showError('必须选择解析器');
      return;
    }

    final pagination = _buildPagination();
    if (pagination == null) return;
    final body = switch (bodyType) {
      _BodyType.none => const RequestBodyRule.none(),
      _BodyType.form => RequestBodyRule.form(bodyFields),
      _BodyType.text => RequestBodyRule.text(bodyTextController.text),
      _BodyType.json => RequestBodyRule.json(bodyFields),
    };
    final autocompleteTimeout = int.tryParse(
      autocompleteTimeoutController.text,
    );
    if (autocompleteTimeout == null) {
      await _showError('开始搜索时间必须是数字');
      return;
    }
    presentation = presentation.copyWith(
      autocompleteSplitChar: autocompleteSplitController.text,
      autocompleteTimeout: autocompleteTimeout,
    );
    final endpoint = EndpointRule(
      id: id,
      kind: kind,
      name: name,
      icon: icon,
      visible: visible,
      request: RequestRule(
        method: method,
        url: urlController.text.trim(),
        query: query,
        headers: headers,
        body: body,
        idempotent: idempotent,
      ),
      parserId: parserId,
      pagination: pagination,
      cachePolicy: cachePolicy,
      links: EndpointLinks(
        item: itemLink,
        autocomplete: autocompleteLink,
        reader: readerLink,
      ),
      presentation: presentation,
    );
    if (mounted) Navigator.of(context).pop(endpoint);
  }

  PaginationRule? _buildPagination() {
    switch (paginationType) {
      case _PaginationType.none:
        return const PaginationRule.none();
      case _PaginationType.pageNumber:
        final initial = int.tryParse(pageInitialController.text);
        final step = int.tryParse(pageStepController.text);
        final pageSize = int.tryParse(pageSizeController.text);
        if (initial == null || step == null || pageSize == null) {
          _showError('分页数字格式不正确');
          return null;
        }
        return PaginationRule.pageNumber(
          variable: pageVariableController.text.trim(),
          initial: initial,
          step: step,
          pageSize: pageSize,
          endCondition: endCondition,
        );
      case _PaginationType.continuation:
        return PaginationRule.continuation(
          target: continuationTarget,
          variable: continuationTarget == ContinuationTarget.variable
              ? continuationVariableController.text.trim()
              : null,
          responseField: responseFieldController.text.trim(),
        );
    }
  }

  Future<void> _showError(String message) => showCupertinoConfirmDialog(
    context: context,
    title: '无法保存',
    content: message,
    showCancel: false,
  );

  @override
  void dispose() {
    for (final controller in [
      idController,
      nameController,
      urlController,
      bodyTextController,
      pageVariableController,
      pageInitialController,
      pageStepController,
      pageSizeController,
      continuationVariableController,
      responseFieldController,
      autocompleteSplitController,
      autocompleteTimeoutController,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }
}

class _SubpageDialog extends StatefulWidget {
  const _SubpageDialog({required this.initialValue});

  final EndpointSubpage initialValue;

  @override
  State<_SubpageDialog> createState() => _SubpageDialogState();
}

class _SubpageDialogState extends State<_SubpageDialog> {
  late final TextEditingController name = TextEditingController(
    text: widget.initialValue.name,
  );
  late final TextEditingController key = TextEditingController(
    text: widget.initialValue.key,
  );
  late final TextEditingController value = TextEditingController(
    text: widget.initialValue.value,
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Column(
        children: [
          RuleTextField(label: '名称', controller: name),
          RuleTextField(label: 'Key', controller: key),
          RuleTextField(label: 'Value', controller: value),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(
            EndpointSubpage(name: name.text, key: key.text, value: value.text),
          ),
          child: const Text('保存'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    name.dispose();
    key.dispose();
    value.dispose();
    super.dispose();
  }
}

class _FilterDialog extends StatefulWidget {
  const _FilterDialog({required this.initialValue});

  final EndpointFilter initialValue;

  @override
  State<_FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<_FilterDialog> {
  late final TextEditingController name = TextEditingController(
    text: widget.initialValue.name,
  );
  late final TextEditingController key = TextEditingController(
    text: widget.initialValue.key,
  );
  late final TextEditingController defaultValue = TextEditingController(
    text: widget.initialValue.defaultValue,
  );
  late EndpointFilterType type = widget.initialValue.type;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Column(
        children: [
          RuleTextField(label: '名称', controller: name),
          RuleTextField(label: 'Key', controller: key),
          RuleSelectField(
            label: '类型',
            value: _filterTypeLabel(type),
            onPressed: _selectType,
          ),
          RuleTextField(label: '默认值', controller: defaultValue),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(
            EndpointFilter(
              name: name.text,
              key: key.text,
              type: type,
              defaultValue: defaultValue.text,
            ),
          ),
          child: const Text('保存'),
        ),
      ],
    );
  }

  Future<void> _selectType() async {
    final value = await showCupertinoSelectDialog<EndpointFilterType>(
      context: context,
      selectedValue: type,
      items: EndpointFilterType.values.map(
        (type) => SelectTileItem(title: _filterTypeLabel(type), value: type),
      ),
    );
    if (value != null) setState(() => type = value);
  }

  @override
  void dispose() {
    name.dispose();
    key.dispose();
    defaultValue.dispose();
    super.dispose();
  }
}

String _kindLabel(EndpointKind kind) => switch (kind) {
  EndpointKind.list => '列表',
  EndpointKind.gallery => '详情',
  EndpointKind.reader => '阅读器',
  EndpointKind.autocomplete => '自动补全',
};

IconData _kindIcon(EndpointKind kind) => switch (kind) {
  EndpointKind.list => CupertinoIcons.list_bullet,
  EndpointKind.gallery => CupertinoIcons.rectangle_grid_2x2,
  EndpointKind.reader => CupertinoIcons.book,
  EndpointKind.autocomplete => CupertinoIcons.search,
};

String _cacheLabel(EndpointCachePolicy policy) => switch (policy) {
  EndpointCachePolicy.networkFirst => '网络优先',
  EndpointCachePolicy.cacheFirst => '缓存优先',
  EndpointCachePolicy.noCache => '不使用缓存',
};

String _bodyLabel(_BodyType type) => switch (type) {
  _BodyType.none => '无',
  _BodyType.form => '表单',
  _BodyType.text => '文本',
  _BodyType.json => '对象',
};

String _paginationLabel(_PaginationType type) => switch (type) {
  _PaginationType.none => '无',
  _PaginationType.pageNumber => '页码',
  _PaginationType.continuation => '续页标记',
};

String _endConditionLabel(PageEndCondition condition) => switch (condition) {
  PageEndCondition.emptyItems => '返回空列表',
  PageEndCondition.shortPage => '返回数量少于每页数量',
  PageEndCondition.missingContinuation => '缺少续页标记',
};

String _continuationTargetLabel(ContinuationTarget target) => switch (target) {
  ContinuationTarget.url => '作为下一页 URL',
  ContinuationTarget.variable => '写入请求变量',
};

String _filterTypeLabel(EndpointFilterType type) => switch (type) {
  EndpointFilterType.boolean => '布尔',
  EndpointFilterType.integer => '整数',
  EndpointFilterType.decimal => '小数',
  EndpointFilterType.text => '文本',
};
