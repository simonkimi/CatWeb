import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/selector_editor.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/widget.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtraParserEditor extends StatelessWidget {
  const ExtraParserEditor({
    super.key,
    required this.parser,
  });

  final IParserBase parser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView(
        children: [
          parser.extra.obx(() {
            return Column(
              children: parser.extra.map((e) {
                return CupertinoCardTile(
                  title: Text(e.id),
                  trailing: const Icon(Icons.more_horiz_outlined),
                  onTap: () {
                    showCupertinoModalSheet(
                      context: context,
                      builder: (context) => SelectorEditor(
                        extraSelector: e,
                        title: e.id,
                      ),
                    );
                  },
                  onTrailingTap: () {},
                );
              }),
            );
          }),
          CupertinoCardTile(
            title: const Text('添加规则'),
            leading: const Icon(CupertinoIcons.add),
            onTap: () {
              showCupertinoInputDialog(context, title: '规则id', initialValue: '')
                  .then((value) {
                if (value == null) return;
                parser.extra.add(ExtraSelector(id: value));
              });
            },
          ),
        ],
      ),
    );
  }
}
