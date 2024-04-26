import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/auto_complete.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/extra_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/gallery_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/image_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/list_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_notifier.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RulesParserEditor extends StatelessWidget {
  const RulesParserEditor({
    super.key,
    required this.model,
  });

  final ParserModel model;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ChangeNotifierProvider(
        create: (_) => RuleParserNotifier(model),
      ),
      child: DefaultTabController(
        length: 3,
        child: CupertinoPageScaffold(
          navigationBar: _buildAppbar(context),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CupertinoTabBarView(
      tabs: const [
        CupertinoTab('基础规则'),
        CupertinoTab('附加字段'),
      ],
      children: [
        _buildEditor(context),
        ExtraParserEditor(
          parser: DetailParser(
            name: '123123',
            uuid: '12132',
          ),
        ),
      ],
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () => context.pop(),
        padding: EdgeInsets.zero,
        minSize: 0,
        child: const Icon(CupertinoIcons.back),
      ),
      middle: const Text('规则'),
      border: const Border(),
    );
  }

  Widget _buildEditor(BuildContext context) {
    final notifier = context.watch<RuleParserNotifier>();

    return switch (notifier.parser) {
      ParserModel.detail => const DetailParserEditor(),
      ParserModel.list => const ListParserEditor(),
      ParserModel.autoComplete => const AutoCompleteParserEditor(),
      ParserModel.imageReader => const NewImageParserEditor(),
      _ => throw UnimplementedError('Unknown parser type: ${notifier.parser}'),
    };
  }
}
