import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/ui/components/list_card.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/list_extended_card.dart';
import 'package:flutter/material.dart';

class ListParserPreview extends StatelessWidget {
  const ListParserPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ListRpcModel_Item(
        env: {},
        title: 'Title',
        subtitle: 'SubTitle',
        star: 4.5,
        tag: ListRpcModel_Tag(text: 'Category', color: ColorRpcModel()),
        imgCount: 100,
        uploadTime: DateTime.now().toString().split('.')[0],
        paper: 'paper',
        badges: [
          ...Colors.primaries
              .take(9)
              .toList()
              .asMap()
              .map((key, value) => MapEntry(
                  key,
                  ListRpcModel_Tag(
                    text: 'Tag ${key + 1}',
                    color: ColorRpcModel(
                        a: value.alpha,
                        r: value.red,
                        g: value.green,
                        b: value.blue),
                  )))
              .values,
          ListRpcModel_Tag(
            text: 'Tag 10',
          )
        ]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 5),
        ListExtendedCard(
          model: model,
          onTap: () {},
        ),
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
