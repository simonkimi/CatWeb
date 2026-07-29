import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_executor.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/delay_task.dart';
import 'package:flutter/cupertino.dart';

/// 搜索输入和自动补全请求的状态控制器。
///
/// 新输入会取消前一个请求，并通过 generation 阻止迟到结果覆盖当前关键词。
class SearchNotifier with ChangeNotifier {
  SearchNotifier({
    required this.listEndpoint,
    required this.website,
    required this.requestContext,
  }) : autocompleteEndpoint = listEndpoint.links.autocomplete == null
           ? null
           : website.endpoint(listEndpoint.links.autocomplete!) {
    if (autocompleteEndpoint != null) {
      textController.addListener(_onTextChanged);
      focusNode.addListener(_onFocusChanged);
    }
  }

  final EndpointRule listEndpoint;
  final SiteRenderConfigModel website;
  final RequestContext requestContext;
  final EndpointRule? autocompleteEndpoint;

  final textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final DelayTask debounce = DelayTask();

  var isLoading = false;
  var suggestions = <AutoCompleteResultItem>[];
  var _generation = 0;
  CancellationScope? _cancellation;

  void onSubmitted(String value) {
    _cancelPending('Search submitted', clearSuggestions: true);
    logger.d('NewSearch: $value');
  }

  void _onTextChanged() {
    debounce.cancel();
    final text = textController.text.trim();
    if (!focusNode.hasFocus || text.isEmpty) {
      _cancelPending('Autocomplete input cleared', clearSuggestions: true);
      return;
    }
    if (textController.selection.baseOffset != textController.text.length) {
      return;
    }
    debounce.post(const Duration(milliseconds: 300), () {
      if (focusNode.hasFocus && textController.text.trim() == text) {
        _loadSuggestData(text);
      }
    });
  }

  void _onFocusChanged() {
    if (!focusNode.hasFocus) {
      _cancelPending('Autocomplete lost focus', clearSuggestions: true);
    }
  }

  void _cancelPending(
    Object reason, {
    required bool clearSuggestions,
    bool notify = true,
  }) {
    debounce.cancel();
    _generation++;
    _cancellation?.cancel(reason);
    _cancellation = null;
    final didChange = isLoading || (clearSuggestions && suggestions.isNotEmpty);
    isLoading = false;
    if (clearSuggestions) suggestions.clear();
    if (notify && didChange) notifyListeners();
  }

  Future<void> _loadSuggestData(String keyword) async {
    final endpoint = autocompleteEndpoint;
    if (endpoint == null) return;
    final generation = ++_generation;
    _cancellation?.cancel('Superseded autocomplete request');
    final cancellation = CancellationScope();
    _cancellation = cancellation;
    isLoading = true;
    notifyListeners();
    try {
      final result = await website.session.execute<AutoCompleteResult>(
        SiteOperation<AutoCompleteResult>(
          endpointId: endpoint.id,
          context: requestContext,
          inputs: {'search': keyword},
        ),
        cancellation,
      );
      cancellation.throwIfCancelled();
      if (generation != _generation) return;
      suggestions = List<AutoCompleteResultItem>.of(
        result.data.items ?? const [],
      );
    } on CancellationException {
      return;
    } catch (error, stackTrace) {
      if (generation != _generation) return;
      suggestions.clear();
      logger.e('Autocomplete request failed', error, stackTrace);
    } finally {
      if (generation == _generation) {
        isLoading = false;
        notifyListeners();
      }
    }
  }

  void onSuggestionSelected(AutoCompleteResultItem item) {
    final completion = item.complete ?? item.title;
    if (completion == null || completion.isEmpty) return;
    textController.value = TextEditingValue(
      text: completion,
      selection: TextSelection.collapsed(offset: completion.length),
    );
    suggestions.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    textController.removeListener(_onTextChanged);
    focusNode.removeListener(_onFocusChanged);
    _cancelPending(
      'Autocomplete disposed',
      clearSuggestions: false,
      notify: false,
    );
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
