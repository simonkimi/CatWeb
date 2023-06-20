import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/selector_editor.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExtraParser extends StatefulWidget {
  const NewExtraParser({
    Key? key,
    required this.parser,
  }) : super(key: key);

  final IParserBase parser;

  @override
  State<NewExtraParser> createState() => _NewExtraParserState();
}

class _NewExtraParserState extends State<NewExtraParser> {
  late final List<ExtraSelector> extra;

  @override
  void initState() {
    super.initState();
    extra = widget.parser.extra.toList();
  }

  void _updateResource() {
    widget.parser.extra = extra;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView(
        children: [
          ...extra
              .map(
                (e) => CupertinoCardTile(
                  title: Text(e.id),
                  trailing: const Icon(Icons.more_horiz_outlined),
                  onTap: () {
                    showCupertinoModalSheet(
                      context: context,
                      builder: (context) => SelectorEditor(
                        onChanged: (selector) {
                          setState(() {
                            extra[extra.indexOf(e)] = e.copyWith(
                              selector: selector,
                            );
                          });
                          _updateResource();
                        },
                        onExtraChanged: (newExtra) {
                          setState(() {
                            extra[extra.indexOf(e)] = newExtra;
                          });
                          _updateResource();
                        },
                        extraSelector: e,
                        title: e.id,
                      ),
                    );
                  },
                  onTrailingTap: () {},
                ),
              )
              .toList(),
          CupertinoCardTile(
            title: const Text('添加规则'),
            leading: const Icon(CupertinoIcons.add),
            onTap: () {
              showCupertinoInputDialog(context, title: '规则id', initialValue: '')
                  .then((value) {
                if (value == null) return;
                setState(() {
                  extra.add(ExtraSelector(id: value));
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
