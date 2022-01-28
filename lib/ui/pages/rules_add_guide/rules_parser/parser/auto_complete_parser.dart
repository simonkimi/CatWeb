import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:catweb/ui/components/rules_card.dart';
import 'package:flutter/cupertino.dart';

class SearchAutoCompleteParser extends StatelessWidget {
  const SearchAutoCompleteParser({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AutoCompleteParserModel model;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildBaseList(context),
        _buildInfoList(),
      ],
    );
  }

  SliverList _buildBaseList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        RulesCard(title: '基础信息', children: [
          CupertinoFormInput(
            label: '名称',
            value: model.name,
          ),
          CupertinoFormInput(
            label: '分割线',
            value: model.split,
          ),
        ]),
      ]),
    );
  }

  StickyClassifyList _buildInfoList() {
    return StickyClassifyList(title: '基础信息', children: [
      RulesForm(
        title: '项目选择器',
        selectorModel: model.itemSelector,
      ),
      RulesForm(
        title: '补全内容',
        selectorModel: model.itemComplete,
      ),
      RulesForm(
        title: '标题',
        selectorModel: model.itemTitle,
      ),
      RulesForm(
        title: '副标题',
        selectorModel: model.itemSubtitle,
      ),
    ]);
  }
}
