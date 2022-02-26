import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/simple_sliver.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/controller/search_list_controller.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/controller/subpage_controller.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/subpage_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'list_filter.dart';

class SearchList extends StatefulWidget {
  const SearchList({
    Key? key,
    required this.blueprint,
  }) : super(key: key);

  final PageBlueprintModel blueprint;

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  late PageBlueprintModel blueprint = widget.blueprint;
  late SubListController controller;
  late final extra = blueprint.templateData as TemplateListDataModel;
  late final SearchListController inputController;
  var isSearchMode = true;

  @override
  void initState() {
    super.initState();
    inputController = SearchListController(model: extra, onSearch: onSearch);
    controller = SubListController(blueprint: widget.blueprint);
  }

  void onSearch(String value) {
    controller.onNewSearch(value);
    setState(() {
      isSearchMode = false;
    });
  }

  Future<bool> _onWillPop() async {
    if (isSearchMode && controller.items.isNotEmpty) {
      setState(() {
        isSearchMode = false;
      });
      inputController.focusNode.unfocus();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: CupertinoPageScaffold(
        child: CupertinoScrollbar(
          child: CupertinoAppBar(
            title: '搜索',
            leading: CupertinoBackLeading(
              onPressed: () async {
                _onWillPop().then((value) {
                  if (value) {
                    Get.back();
                  }
                });
              },
            ),
            tabBar: _buildSearchInput(context),
            tabBarHeight: 40,
            actions: _buildAction(context),
            child:
                isSearchMode ? _buildSearchList(context) : _buildList(context),
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return SubPageListFragment(
      controller: controller,
      hasTabBar: true,
      hasToolBar: true,
      tabBarHeight: 40,
    );
  }

  Widget _buildSearchList(BuildContext context) {
    return Obx(() => CustomScrollView(
          slivers: [
            const SliverPullToRefresh(
              extraHeight: 40,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final model = inputController.suggestions[index];
                  return _buildSuggestionItem(model, context);
                },
                childCount: inputController.suggestions.length,
              ),
            ),
          ],
        ));
  }

  Widget _buildSuggestionItem(
      AutoCompleteRpcModel_Item model, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        inputController.onSuggestionSelected(model);
      },
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Icon(CupertinoIcons.tag, size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (model.title.isNotEmpty)
                      Text(
                        model.title,
                        style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (model.subtitle.trim().isNotEmpty) ...[
                      const SizedBox(width: 10),
                      Text(
                        model.subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.placeholderText
                              .resolveFrom(context),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAction(BuildContext context) {
    return [if (hasFilter) ListFilterButton(controller: controller)];
  }

  Widget _buildSearchInput(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: CupertinoTextField(
          controller: inputController.textController,
          focusNode: inputController.focusNode,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
            borderRadius: BorderRadius.circular(50),
          ),
          placeholder: '搜索',
          placeholderStyle: TextStyle(
            fontSize: 14,
            color: CupertinoColors.placeholderText.resolveFrom(context),
          ),
          onChanged: inputController.onTextChanged,
          clearButtonMode: OverlayVisibilityMode.editing,
          prefix: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 18,
              height: 18,
              child: Obx(() => inputController.isLoading.value
                  ? const CupertinoActivityIndicator()
                  : const Icon(
                      CupertinoIcons.search,
                      color: CupertinoColors.systemGrey,
                      size: 18,
                    )),
            ),
          ),
          onSubmitted: inputController.onSubmitted,
          onTap: () {
            setState(() {
              isSearchMode = true;
            });
          },
        ),
      ),
    );
  }

  bool get hasFilter => extra.filterItem.isNotEmpty;
}
