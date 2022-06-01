import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/handle.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchListController {
  final ValueChanged<String> onSearch;
  final FocusNode focusNode = FocusNode();
  final Handler handler = Handler();

  final TextEditingController textController = TextEditingController();
  final website = Get.find<GlobalController>().website;

  late final PageBlueprintModel? blueprint;

  final isLoading = false.obs;
  final suggestions = RxList<AutoCompleteRpcModel_Item>();

  String get splitChar =>
      extra.splitChar.value.isEmpty ? ' ' : extra.splitChar.value;

  SearchListController({
    required TemplateListDataModel model,
    required this.onSearch,
  }) {
    blueprint = website.configModel.getPage(model.targetAutoComplete.value);

    if (blueprint != null) {
      textController.addListener(() {
        if (textController.selection.baseOffset == textController.text.length) {
          handler.post(
              int.tryParse(extra.timeout.value) == 0
                  ? 1000
                  : extra.timeout.value, () {
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
        localEnv: SiteEnvModel({
          'search': keyword,
        }),
      );
      suggestions.clear();
      suggestions.addAll(result.items);
    } finally {
      isLoading.value = false;
    }
  }

  void onSuggestionSelected(AutoCompleteRpcModel_Item item) {
    final keyWords = textController.text.split(splitChar);
    keyWords.removeLast();
    keyWords.add(item.complete);
    final text = keyWords.join(splitChar) + splitChar;
    textController.value = TextEditingValue(
      text: text,
      selection: TextSelection.fromPosition(TextPosition(
        offset: text.length,
      )),
    );
    onTextChanged(text);
  }

  TemplateAutoCompleteModel get extra =>
      blueprint!.templateData as TemplateAutoCompleteModel;
}
