import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:catweb/ui/components/rules_card.dart';
import 'package:flutter/cupertino.dart';

class ImageReaderParserFragment extends StatelessWidget {
  const ImageReaderParserFragment({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ImageReaderParserModel model;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildBaseList(context),
        _buildImage(),
        _buildMetaInfo(),
        _buildBadgeList(),
      ],
    );
  }

  SliverList _buildBaseList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        RulesCard(title: '基础信息', children: [
          CupertinoFormInput(
            label: '名称',
            value: model.name,
          )
        ]),
      ]),
    );
  }

  StickyClassifyList _buildImage() {
    return StickyClassifyList(title: '缩略图', children: [
      RulesForm(
        title: '图片地址',
        selectorModel: model.image.imgUrl,
      ),
      RulesForm(
        title: '图片宽度',
        selectorModel: model.image.imgWidth,
      ),
      RulesForm(
        title: '图片高度',
        selectorModel: model.image.imgHeight,
      ),
      RulesForm(
        title: '图片X偏移',
        selectorModel: model.image.imgX,
      ),
      RulesForm(
        title: '图片Y偏移',
        selectorModel: model.image.imgY,
      ),
    ]);
  }

  StickyClassifyList _buildMetaInfo() {
    return StickyClassifyList(title: '图片信息', children: [
      RulesForm(
        title: '大图地址',
        selectorModel: model.largerImage,
      ),
      RulesForm(
        title: '原图地址',
        selectorModel: model.rawImage,
      ),
      RulesForm(
        title: '级别',
        selectorModel: model.rating,
      ),
      RulesForm(
        title: '评分',
        selectorModel: model.score,
      ),
      RulesForm(
        title: '来源',
        selectorModel: model.source,
      ),
      RulesForm(
        title: '上传时间',
        selectorModel: model.uploadTime,
      ),
    ]);
  }

  StickyClassifyList _buildBadgeList() {
    return StickyClassifyList(
      title: '徽章',
      children: [
        RulesForm(
          title: '徽章项目',
          selectorModel: model.badgeSelector,
        ),
        RulesForm(
          title: '徽章内容',
          selectorModel: model.badgeText,
        ),
        RulesForm(
          title: '徽章类型',
          selectorModel: model.badgeCategory,
        ),
      ],
    );
  }
}
