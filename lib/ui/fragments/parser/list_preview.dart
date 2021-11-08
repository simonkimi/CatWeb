import 'package:catweb/ui/components/list_card.dart';
import 'package:flutter/material.dart';

class ListParserPreview extends StatelessWidget {
  const ListParserPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = CardModel(
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
                  CardTag(
                    text: 'Tag ${key + 1}',
                    color: value,
                  )))
              .values,
          CardTag(
            text: 'Tag 10',
          )
        ]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExtendedCard(model: model),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: SimpleCard(model: model),
            ),
          ],
        )
      ],
    );
  }
}
