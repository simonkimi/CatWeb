import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/simple_sliver.dart';
import 'package:catweb/ui/pages/view_page/list/subpage_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'list_filter.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
    this.onSearch,
  });

  final ValueChanged<String>? onSearch;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _SearchList extends StatefulWidget {
  const _SearchList({
    super.key,
    this.onSearch,
  });

  final ValueChanged<String>? onSearch;

  @override
  State<_SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<_SearchList> {
  var isSearchMode = true;
  var isInit = false;

  SitePageRule get siteRule => context.read<PageConfig>().pageRule;

  PageTemplateList get template => siteRule.templateList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) return;
    inputController = SearchListController(model: extra, onSearch: onSearch);
    isInit = true;
  }

  void onSearch(String value) {
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
            canHide: controller.items.isNotEmpty,
            title: I.of(context).search,
            leading: CupertinoBackLeading(
              onPressed: () async {
                _onWillPop().then((value) {
                  if (value) {
                    context.pop();
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
    return CustomScrollView(
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
    );
  }

  Widget _buildSuggestionItem(
    AutoCompleteResultItem model,
    BuildContext context,
  ) {
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
                    if (model.title != null)
                      Text(
                        model.title!,
                        style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (model.subtitle != null &&
                        model.subtitle!.trim().isNotEmpty) ...[
                      const SizedBox(width: 10),
                      Text(
                        model.subtitle!,
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
    return [if (hasFilter) const ListFilterButton()];
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
          placeholder: I.of(context).search,
          placeholderStyle: TextStyle(
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

  bool get hasFilter => extra.filters.isNotEmpty;
}
