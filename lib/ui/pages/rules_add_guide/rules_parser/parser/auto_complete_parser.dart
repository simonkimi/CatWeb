import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/form.dart';
import 'package:catweb/ui/widgets/rules_card.dart';
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
            label: I.of(context).name,
            value: model.name,
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
        title: '标题',
        selectorModel: model.itemTitle,
      ),
      RulesForm(
        title: '副标题',
        selectorModel: model.itemSubtitle,
      ),
      RulesForm(
        title: '补全内容',
        selectorModel: model.itemComplete,
      ),
    ]);
  }
}
