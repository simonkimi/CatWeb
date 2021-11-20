import 'dart:math';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:catweb/ui/components/rules_card.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListParserFragment extends StatelessWidget {
  const ListParserFragment({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ListViewParserModel model;

  @override
  Widget build(BuildContext context) {
    final labelWidth = ['解析器名称', '项目选择器']
        .map((e) => boundingTextSize(
            context: context,
            text: e,
            style: const TextStyle(
              color: CupertinoColors.label,
              fontSize: 12,
            )).width)
        .reduce(max);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CustomScrollView(
        slivers: [
          buildBaseList(labelWidth),
          buildInfoList(),
          buildCoverList(),
          buildTagList(),
          buildBadgeList(),
          buildIndexList(),
        ],
      ),
    );
  }

  StickyClassifyList buildIndexList() {
    return StickyClassifyList(
      title: '索引',
      children: [
        RulesForm(
          title: '下一面',
          field: '#nextPage',
          selectorModel: model.nextPage,
        ),
      ],
    );
  }

  StickyClassifyList buildBadgeList() {
    return StickyClassifyList(
      title: '徽章',
      children: [
        RulesForm(
          title: '徽章内容',
          field: '#badgeText',
          selectorModel: model.badgeText,
        ),
        RulesForm(
          title: '徽章颜色',
          field: '#badgeColor',
          selectorModel: model.badgeColor,
        ),
      ],
    );
  }

  StickyClassifyList buildTagList() {
    return StickyClassifyList(title: '分类', children: [
      RulesForm(
        title: '分类',
        field: '#tag',
        selectorModel: model.tag,
      ),
      RulesForm(
        title: '分类颜色',
        field: '#tagColor',
        selectorModel: model.tagColor,
      ),
    ]);
  }

  StickyClassifyList buildCoverList() {
    return StickyClassifyList(
      title: '封面设置',
      children: [
        RulesForm(
          title: '封面地址',
          field: '#previewUrl',
          selectorModel: model.previewImg.imgUrl,
        ),
        RulesForm(
          title: '封面宽度',
          field: '#previewWidth',
          selectorModel: model.previewImg.imgWidth,
        ),
        RulesForm(
          title: '封面高度',
          field: '#previewHeight',
          selectorModel: model.previewImg.imgHeight,
        ),
        RulesForm(
          title: '封面X偏移',
          field: '#previewX',
          selectorModel: model.previewImg.imgX,
        ),
        RulesForm(
          title: '封面Y偏移',
          field: '#previewY',
          selectorModel: model.previewImg.imgY,
        ),
      ],
    );
  }

  StickyClassifyList buildInfoList() {
    return StickyClassifyList(
      title: '信息设置',
      children: [
        RulesForm(
          title: '标题',
          field: '#title',
          selectorModel: model.title,
        ),
        RulesForm(
          title: '副标题',
          field: '#subtitle',
          selectorModel: model.subtitle,
        ),
        RulesForm(
          title: '上传时间',
          field: '#uploadTIme',
          selectorModel: model.uploadTime,
        ),
        RulesForm(
          title: '评分',
          field: '#star',
          selectorModel: model.star,
        ),
        RulesForm(
          title: '面数',
          field: '#imageCount',
          selectorModel: model.imgCount,
        ),
      ],
    );
  }

  SliverList buildBaseList(double labelWidth) {
    return SliverList(
        delegate: SliverChildListDelegate([
      RulesCard(title: '基础信息', children: [
        buildCupertinoInput(
            label: '解析器名称', value: model.name, width: labelWidth),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Divider(height: 1, thickness: 0.3),
        ),
        buildCupertinoInput(
            label: '项目选择器', value: model.itemSelector, width: labelWidth),
      ]),
    ]));
  }
}
