import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/parser.pbenum.dart';
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
                        title: ExtraSelectorType.EXTRA_SELECTOR_TYPE_NONE
                            .string(context),
                        value: ExtraSelectorType.EXTRA_SELECTOR_TYPE_NONE,
                      ),
                      if (model.type == ParserType.PARSER_TYPE_LIST_VIEW)
                        ..._buildList(context),
                      if (model.type == ParserType.PARSER_TYPE_GALLERY)
                        ..._buildGallery(context),
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

  List<SelectTileItem<ExtraSelectorType>> _buildList(BuildContext context) {
    return [
      SelectTileItem(
        title: ExtraSelectorType.EXTRA_SELECTOR_TYPE_LIST_ITEM.string(context),
        value: ExtraSelectorType.EXTRA_SELECTOR_TYPE_LIST_ITEM,
      ),
    ];
  }

  List<SelectTileItem<ExtraSelectorType>> _buildGallery(BuildContext context) {
    return [
      SelectTileItem(
        title:
            ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_BADGE.string(context),
        value: ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_BADGE,
      ),
      // if (model.type == ParserType.galleryParser)
      //   SelectTileItem(title: ExtraSelectorType.galleryChapter.string(
      //       context), value: ExtraSelectorType.galleryChapter),
      SelectTileItem(
        title: ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_COMMENT
            .string(context),
        value: ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_COMMENT,
      ),
      SelectTileItem(
        title: ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_THUMBNAIL
            .string(context),
        value: ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_THUMBNAIL,
      ),
    ];
  }
}
