import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/data/protocol/model/selector.dart';
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
    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...model.extraSelectorModel.asMap().entries.map((entity) {
            return Card(
              key: UniqueKey(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: RulesForm(
                  extraSelectorModel: entity.value,
                  selectorModel: entity.value.selector,
                  onDelete: () {
                    model.extraSelectorModel.removeAt(entity.key);
                  },
                ),
              ),
            );
          }),
          Card(
            child: ListTile(
              leading: const Icon(Icons.add),
              title: const Text('添加'),
              onTap: () {
                model.extraSelectorModel.add(ExtraSelectorModel());
              },
            ),
          ),
        ],
      );
    });
  }
}