import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template_auto_complete.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/handle.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchListController {
  final ValueChanged<String> onSearch;
  final FocusNode focusNode = FocusNode();
  final Handler handler = Handler();

  final TextEditingController textController = TextEditingController();
  final website = get<SiteService>().website;

  late final SitePage? blueprint;

  final isLoading = false.obs;
  final suggestions = RxList<AutoCompleteResultItem>();

  String get splitChar =>
      extra.splitChar.value.isEmpty ? ' ' : extra.splitChar.value;

  SearchListController({
    required TemplateList model,
    required this.onSearch,
  }) {
    blueprint = website.blueMap.pageList
        .get((e) => e.uuid == model.targetAutoComplete.value);

    if (blueprint != null) {
      textController.addListener(() {
        if (textController.selection.baseOffset == textController.text.length) {
          handler.post(extra.timeout, () {
            if (focusNode.hasFocus && textController.text.isNotEmpty) {
              requestAutoComplete(textController.text);
            }
          });
        }
      });
    }
  }

  void onTextChanged(String value) {
    suggestions.clear();
  }

  void onSubmitted(String value) {
    handler.cancel();
    onSearch(value);
    logger.d('NewSearch: $value');
  }

  void requestAutoComplete(String value) {
    final keyWords = value.split(splitChar);
    if (keyWords.isNotEmpty) {
      final keyWord = keyWords.last;
      if (keyWord.isNotEmpty) {
        loadSuggestData(keyWord);
      }
    }
  }

  Future<void> loadSuggestData(String keyword) async {
    isLoading.value = true;
    try {
      final result = await website.client.getAutoComplete(
        url: blueprint!.url.value,
        model: blueprint!,
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
      isLoading.value = false;
    }
  }

  void onSuggestionSelected(AutoCompleteResultItem item) {
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
    onTextChanged(text);
  }

  TemplateAutoComplete get extra => blueprint!.template as TemplateAutoComplete;
}
