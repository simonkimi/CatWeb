import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtraParser extends StatelessWidget {
  const ExtraParser({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ParserBaseModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Obx(() => ListView(
            children: [
              ...model.extraSelectorModel.asMap().entries.map((entity) {
                return RulesForm(
                  extraSelectorModel: entity.value,
                  selectorModel: entity.value.selector,
                  onDelete: () {
                    model.extraSelectorModel.removeAt(entity.key);
                  },
                );
              }),
              CupertinoListTile(
                leading: const Icon(Icons.add),
                title: const Text('添加'),
                onTap: () async {
                  final result =
                      await showCupertinoSelectDialog<ExtraSelectorType>(
                    context: context,
                    cancelText: '取消',
                    items: [
                      SelectTileItem(
                          title: ExtraSelectorType.none.string(context),
                          value: ExtraSelectorType.none),
                      if (model.type == ParserType.listParser)
                        SelectTileItem(
                            title: ExtraSelectorType.listItem.string(context),
                            value: ExtraSelectorType.listItem),
                      if (model.type == ParserType.galleryParser)
                        SelectTileItem(
                            title:
                                ExtraSelectorType.galleryBadge.string(context),
                            value: ExtraSelectorType.galleryBadge),
                      // if (model.type == ParserType.galleryParser)
                      //   SelectTileItem(title: ExtraSelectorType.galleryChapter.string(
                      //       context), value: ExtraSelectorType.galleryChapter),
                      if (model.type == ParserType.galleryParser)
                        SelectTileItem(
                            title: ExtraSelectorType.galleryComment
                                .string(context),
                            value: ExtraSelectorType.galleryComment),
                      if (model.type == ParserType.galleryParser)
                        SelectTileItem(
                            title: ExtraSelectorType.galleryThumbnail
                                .string(context),
                            value: ExtraSelectorType.galleryThumbnail),
                    ],
                  );
                  if (result != null) {
                    model.extraSelectorModel
                        .add(ExtraSelectorModel(null, result));
                  }
                },
              ),
            ],
          )),
    );
  }
}
