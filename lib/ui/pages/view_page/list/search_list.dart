import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/simple_sliver.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'list_filter.dart';
import 'notifier/search_list_notifier.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.searchKey});

  final String searchKey;

  @override
  Widget build(BuildContext context) {
    PageConfigProvider pageConfig = context.read();
    ViewerConfigProvider viewerConfig = context.read();
    return ChangeNotifierProvider(
      create: (_) => SearchListNotifier(
        listRule: pageConfig.pageRule,
        website: viewerConfig.website,
      ),
      child: CupertinoPageScaffold(
        child: CupertinoScrollbar(
          child: CupertinoAppBar(
            canHide: false,
            title: I.of(context).search,
            leading: CupertinoBackLeading(
              onPressed: () async {
                context.pop();
              },
            ),
            tabBar: _buildSearchInput(context),
            tabBarHeight: 40,
            actions: _buildAction(context),
            child: _buildSearchList(context),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchList(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPullToRefresh(
          extraHeight: 40,
        ),
        Selector<SearchListNotifier, List<AutoCompleteResultItem>>(
          selector: (context, notifier) => notifier.suggestions,
          builder: (context, suggestions, child) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildSuggestionItem(suggestions[index], context);
                },
                childCount: suggestions.length,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSuggestionItem(
    AutoCompleteResultItem model,
    BuildContext context,
  ) {
    SearchListNotifier notifier = context.read();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        notifier.onSuggestionSelected(model);
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
    SearchListNotifier notifier = context.read();
    return [if (notifier.hasFilter) const ListFilterButton()];
  }

  Widget _buildSearchInput(BuildContext context) {
    SearchListNotifier notifier = context.read();
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: CupertinoTextField(
          controller: notifier.textController,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
            borderRadius: BorderRadius.circular(50),
          ),
          placeholder: I.of(context).search,
          placeholderStyle: TextStyle(
            color: CupertinoColors.placeholderText.resolveFrom(context),
          ),
          clearButtonMode: OverlayVisibilityMode.editing,
          prefix: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 18,
              height: 18,
              child: Selector<SearchListNotifier, bool>(
                selector: (context, notifier) => notifier.isLoading,
                builder: (context, isLoading, child) {
                  return notifier.isLoading
                      ? const CupertinoActivityIndicator()
                      : const Icon(
                          CupertinoIcons.search,
                          color: CupertinoColors.systemGrey,
                          size: 18,
                        );
                },
              ),
            ),
          ),
          onSubmitted: (value) {
            context.pop(value);
          },
        ),
      ),
    );
  }
}
