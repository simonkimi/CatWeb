import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/ui/components/list_card.dart';
import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/list_extended_card.dart';
import 'package:flutter/material.dart';

class ListParserPreview extends StatelessWidget {
  const ListParserPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ViewerListModel(
        envModel: SiteEnvModel(),
        title: 'Title',
        subtitle: 'SubTitle',
        star: 4.5,
        tag: 'Category',
        tagColor: Colors.blue,
        page: 100,
        uploadTime: DateTime.now().toString().split('.')[0],
        paper: 'paper',
        badgeList: [
          ...Colors.primaries
              .take(9)
              .toList()
              .asMap()
              .map((key, value) => MapEntry(
                  key,
                  BadgeList(
                    text: 'Tag ${key + 1}',
                    color: value,
                  )))
              .values,
          BadgeList(
            text: 'Tag 10',
          )
        ]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 5),
        ListExtendedCard(model: model),
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
