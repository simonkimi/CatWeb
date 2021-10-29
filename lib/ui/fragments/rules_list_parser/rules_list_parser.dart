import 'package:cat_web/data/protocol/model/parser.dart';
import 'package:cat_web/ui/components/extended_card.dart';
import 'package:flutter/material.dart';

class RulesListVisualEditor extends StatelessWidget {
  const RulesListVisualEditor({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ListViewParserModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExtendedCard(
          model: ExtendedCardModel(
            title: 'Title',
            subtitle: 'SubTitle',
            star: 4.5,
            category: 'Category',
            categoryColor: Colors.blue,
            page: 100,
            uploadTime: DateTime.now().toString().split('.')[0],
            badge: 'Badge',
            tagList: [
              ...Colors.primaries
                  .take(9)
                  .toList()
                  .asMap()
                  .map((key, value) => MapEntry(
                  key,
                  ExtendedCardTag(
                    text: 'Tag ${key + 1}',
                    color: value,
                  )))
                  .values,
              ExtendedCardTag(
                text: 'Tag 10',
              )
            ]
          ),
        ),
      ],
    );
  }
}
