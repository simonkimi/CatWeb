import 'dart:math';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/ui/widgets/form.dart';
import 'package:catweb/ui/widgets/rules_card.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListParserFragment extends StatelessWidget {
  const ListParserFragment({
    super.key,
    required this.model,
  });

  final ListViewParserModel model;

  @override
  Widget build(BuildContext context) {
    final labelWidth = ['解析器名称', '项目选择器']
        .map((e) => boundingTextSize(
            context: context,
            text: e,
            style: const TextStyle(
              color: FixColor.title,
              fontSize: 12,
            )).width)
        .reduce(max);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CustomScrollView(
        slivers: [
          _buildBaseList(context, labelWidth),
          _buildInfoList(),
          _buildCoverList(),
          _buildTagList(),
          _buildBadgeList(),
          _buildIndexList(),
          _buildFlagList(),
        ],
      ),
    );
  }

  Widget _buildFlagList() {
    return StickyClassifyList(
      title: '标志位',
      children: [
        RulesForm(
          title: '成功标志',
          selectorModel: model.successSelector,
        ),
        RulesForm(
          title: '失败标志',
          selectorModel: model.failedSelector,
        ),
      ],
    );
  }

  Widget _buildIndexList() {
    return StickyClassifyList(
      title: '索引',
      children: [
        RulesForm(
          title: '下一面',
          selectorModel: model.nextPage,
        ),
      ],
    );
  }

  StickyClassifyList _buildBadgeList() {
    return StickyClassifyList(
      title: '徽章',
      children: [
        RulesForm(
          title: '徽章内容',
          selectorModel: model.badgeText,
        ),
        RulesForm(
          title: '徽章颜色',
          selectorModel: model.badgeColor,
        ),
      ],
    );
  }

  StickyClassifyList _buildTagList() {
    return StickyClassifyList(title: '分类', children: [
      RulesForm(
        title: '分类',
        selectorModel: model.tag,
      ),
      RulesForm(
        title: '分类颜色',
        selectorModel: model.tagColor,
      ),
    ]);
  }

  StickyClassifyList _buildCoverList() {
    return StickyClassifyList(
      title: '封面设置',
      children: [
        RulesForm(
          title: '封面地址',
          selectorModel: model.previewImg.imgUrl,
        ),
        RulesForm(
          title: '封面宽度',
          selectorModel: model.previewImg.imgWidth,
        ),
        RulesForm(
          title: '封面高度',
          selectorModel: model.previewImg.imgHeight,
        ),
        RulesForm(
          title: '封面X偏移',
          selectorModel: model.previewImg.imgX,
        ),
        RulesForm(
          title: '封面Y偏移',
          selectorModel: model.previewImg.imgY,
        ),
      ],
    );
  }

  StickyClassifyList _buildInfoList() {
    return StickyClassifyList(
      title: '信息设置',
      children: [
        RulesForm(
          title: 'idCode',
          selectorModel: model.idCode,
        ),
        RulesForm(
          title: '标题',
          selectorModel: model.title,
        ),
        RulesForm(
          title: '副标题',
          selectorModel: model.subtitle,
        ),
        RulesForm(
          title: '上传时间',
          selectorModel: model.uploadTime,
        ),
        RulesForm(
          title: '评分',
          selectorModel: model.star,
        ),
        RulesForm(
          title: '面数',
          selectorModel: model.imgCount,
        ),
        RulesForm(
          title: '语言',
          selectorModel: model.language,
        ),
      ],
    );
  }

  SliverList _buildBaseList(BuildContext context, double labelWidth) {
    return SliverList(
        delegate: SliverChildListDelegate([
      RulesCard(title: '基础信息', children: [
        CupertinoFormInput(
          label: '解析器名称',
          value: model.name,
          width: labelWidth,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Divider(
            height: 1,
            thickness: 0.3,
            color: isDarkMode(context)
                ? CupertinoColors.systemGrey6.darkColor
                : CupertinoColors.systemGrey6,
          ),
        ),
        CupertinoFormInput(
          label: '项目选择器',
          value: model.itemSelector.selector,
          width: labelWidth,
        ),
      ]),
    ]));
  }
}
