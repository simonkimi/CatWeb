import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class NewImageParserEditor extends StatelessWidget {
  const NewImageParserEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildImage(context),
        _buildMetaInfo(context),
        _buildBadgeList(context),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('图片'),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: '图片地址',
          selector: (n) => n.image.image.url,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(
            image: n.image.image.copyWith(url: v),
          )),
        ),
        ParserTileConsumer(
          title: '图片宽度',
          selector: (n) => n.image.image.width,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(
            image: n.image.image.copyWith(width: v),
          )),
        ),
        ParserTileConsumer(
          title: '图片高度',
          selector: (n) => n.image.image.height,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(
            image: n.image.image.copyWith(height: v),
          )),
        ),
        ParserTileConsumer(
          title: '图片X偏移',
          selector: (n) => n.image.image.x,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(
            image: n.image.image.copyWith(x: v),
          )),
        ),
        ParserTileConsumer(
          title: '图片Y偏移',
          selector: (n) => n.image.image.y,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(
            image: n.image.image.copyWith(y: v),
          )),
        ),
      ],
    );
  }

  Widget _buildMetaInfo(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('图片信息'),
      hasLeading: false,
      children: [
        // ParserTile(
        //   title: '大图地址',
        //   selector: parser.largerImage,
        // ),
        // ParserTile(
        //   title: '原图地址',
        //   selector: parser.rawImage,
        // ),
        // ParserTile(
        //   title: '级别',
        //   selector: parser.rating,
        // ),
        // ParserTile(
        //   title: '评分',
        //   selector: parser.score,
        // ),
        // ParserTile(
        //   title: '来源',
        //   selector: parser.source,
        // ),
        // ParserTile(
        //   title: '上传时间',
        //   selector: parser.uploadTime,
        // ),
        ParserTileConsumer(
          title: '大图地址',
          selector: (n) => n.image.largerImage,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(largerImage: v)),
        ),
        ParserTileConsumer(
          title: '原图地址',
          selector: (n) => n.image.rawImage,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(rawImage: v)),
        ),
        ParserTileConsumer(
          title: '级别',
          selector: (n) => n.image.rating,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(rating: v)),
        ),
        ParserTileConsumer(
          title: '评分',
          selector: (n) => n.image.score,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(score: v)),
        ),
        ParserTileConsumer(
          title: '来源',
          selector: (n) => n.image.source,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(source: v)),
        ),
        ParserTileConsumer(
          title: '上传时间',
          selector: (n) => n.image.uploadTime,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(uploadTime: v)),
        ),
      ],
    );
  }

  Widget _buildBadgeList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('标签'),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: '标签项目',
          selector: (n) => n.image.tagSelector,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(tagSelector: v)),
        ),
        ParserTileConsumer(
          title: '标签内容',
          selector: (n) => n.image.tagItem.text,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(
            tagItem: n.image.tagItem.copyWith(text: v),
          )),
        ),
        ParserTileConsumer(
          title: '标签类型',
          selector: (n) => n.image.tagItem.category,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(
            tagItem: n.image.tagItem.copyWith(category: v),
          )),
        ),
        ParserTileConsumer(
          title: '标签颜色',
          selector: (n) => n.image.tagItem.color,
          onChanged: (n, v) => n.updateParser(n.image.copyWith(
            tagItem: n.image.tagItem.copyWith(color: v),
          )),
        ),
      ],
    );
  }
}
