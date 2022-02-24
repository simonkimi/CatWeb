import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/subpage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';

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

  bool get hasFilter => extra.filterItem.isNotEmpty;

  @override
  void initState() {
    super.initState();
    controller = SubListController(blueprint: widget.blueprint);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        child: CupertinoAppBar(
          title: '搜索',
          leading: const CupertinoBackLeading(),
          tabBar: _buildSearchInput(context),
          tabBarHeight: 40,
          actions: _buildAction(context),
          child: SmartRefresher(
            controller: controller.refreshController,
            enablePullDown: false,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAction(BuildContext context) {
    return [
      if (hasFilter)
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: Obx(() => AnimatedSwitcher(
                duration: 200.milliseconds,
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: useFilter
                    ? const Icon(Icons.filter_alt, key: ValueKey('enable'))
                    : const Icon(Icons.filter_alt_outlined,
                        key: ValueKey('disable')),
              )),
          onPressed: () => _showFilterDialog(context),
        )
    ];
  }

  Widget _buildSearchInput(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: CupertinoTextField(
          decoration: BoxDecoration(
            color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
            borderRadius: BorderRadius.circular(50),
          ),
          placeholder: '搜索',
          placeholderStyle: TextStyle(
            fontSize: 14,
            color: CupertinoColors.placeholderText.resolveFrom(context),
          ),
          prefix: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 18,
              height: 18,
              child: Icon(
                CupertinoIcons.search,
                color: CupertinoColors.systemGrey,
                size: 18,
              ),
            ),
          ),
          onSubmitted: (value) {},
        ),
      ),
    );
  }

  bool get useFilter =>
      List.generate(extra.filterItem.length, (i) => i).any((e) =>
          controller.filter[e].value.value != extra.filterItem[e].value.value);

  void _showFilterDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildDialogHeader(setState),
                    const SizedBox(height: 5),
                    const CupertinoDivider(),
                    for (final item in controller.filter)
                      _buildFilterItem(context, item),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Row _buildDialogHeader(StateSetter setState) {
    return Row(
      children: [
        const Text(
          '过滤器',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Expanded(child: SizedBox()),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.refresh),
          minSize: 0,
          onPressed: () {
            controller.resetFilter();
            setState(() {});
          },
        )
      ],
    );
  }

  Widget _buildFilterItem(BuildContext context, SearchFilterItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          Text(item.name.value),
          const Expanded(child: SizedBox()),
          if (item.type.value == TemplateListData_FilterType.FILTER_TYPE_BOOL)
            SizedBox(
              height: 30,
              child: Transform.scale(
                scale: 0.8,
                child: Obx(() => CupertinoSwitch(
                      value: item.value.value.toLowerCase().trim() == 'true',
                      onChanged: (value) {
                        item.value.value =
                            item.value.value.toLowerCase() == 'true'
                                ? 'false'
                                : 'true';
                      },
                    )),
              ),
            ),
          if (item.type.value ==
                  TemplateListData_FilterType.FILTER_TYPE_STRING ||
              item.type.value == TemplateListData_FilterType.FILTER_TYPE_NUMBER)
            SizedBox(
              height: 30,
              width: 60,
              child: CupertinoTextField(
                controller: TextEditingController(text: item.value.value),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGroupedBackground
                      .resolveFrom(context),
                  borderRadius: BorderRadius.circular(10),
                ),
                inputFormatters: [
                  if (item.type.value ==
                      TemplateListData_FilterType.FILTER_TYPE_NUMBER)
                    FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: item.type.value ==
                        TemplateListData_FilterType.FILTER_TYPE_NUMBER
                    ? TextInputType.number
                    : null,
                onChanged: (value) {
                  item.value.value = value;
                },
              ),
            ),
        ],
      ),
    );
  }
}
