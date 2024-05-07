import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/delay_task.dart';
import 'package:catweb/utils/iter_helper.dart';
import 'package:flutter/cupertino.dart';

class SearchListNotifier extends ChangeNotifier {
  SearchListNotifier({
    required this.listRule,
    required this.onSearch,
    required this.website,
  }) {
    autoCompleteRule = website.blueMap.pageList
        .get((e) => e.uuid == listRule.templateList.targetAutoComplete);

    if (autoCompleteRule != null) {
      textController.addListener(() {
        if (textController.selection.baseOffset == textController.text.length) {
          final duration = Duration(
              milliseconds: autoCompleteRule!.templateAutoComplete.timeout);
          dailyTask.post(duration, () {
            if (focusNode.hasFocus && textController.text.isNotEmpty) {
              _requestAutoComplete(textController.text);
            }
          });
        }
      });
    }
  }

  final SitePageRule listRule;
  final ValueChanged<String> onSearch;
  final SiteRenderConfigModel website;

  final textController = TextEditingController();
  late final SitePageRule? autoCompleteRule;
  final FocusNode focusNode = FocusNode();
  final DelayTask dailyTask = DelayTask();

  var isLoading = false;
  var suggestions = <AutoCompleteResultItem>[];

  void onSubmitted(String value) {
    dailyTask.cancel();
    onSearch(value);
    logger.d('NewSearch: $value');
  }

  void _requestAutoComplete(String value) {
    assert(autoCompleteRule != null);
    final splitChar = autoCompleteRule!.templateAutoComplete.splitChar;
    final keyWords = value.split(splitChar);
    if (keyWords.isNotEmpty) {
      final keyWord = keyWords.last;
      if (keyWord.isNotEmpty) {
        _loadSuggestData(keyWord);
      }
    }
  }

  Future<void> _loadSuggestData(String keyword) async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await website.client.getAutoComplete(
        url: listRule.url,
        model: listRule,
        localEnv: SiteEnvStore({
          'search': keyword,
        }),
      );
      if (result.items?.isEmpty ?? true) {
        return;
      }
      suggestions.clear();
      suggestions.addAll(result.items!);
    } finally {
      isLoading = true;
      notifyListeners();
    }
  }

  void onSuggestionSelected(AutoCompleteResultItem item) {
    assert(autoCompleteRule != null);
    final splitChar = autoCompleteRule!.templateAutoComplete.splitChar;
    final keyWords = textController.text.split(splitChar);
    keyWords.removeLast();
    keyWords.add(item.complete!);
    final text = keyWords.join(splitChar) + splitChar;
    textController.value = TextEditingValue(
      text: text,
      selection: TextSelection.fromPosition(TextPosition(
        offset: text.length,
      )),
    );
    suggestions.clear();
    notifyListeners();
  }
}
