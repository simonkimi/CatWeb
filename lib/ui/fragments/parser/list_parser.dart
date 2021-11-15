import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:catweb/ui/components/rules_card.dart';
import 'package:flutter/material.dart';

class ListParserFragment extends StatelessWidget {
  const ListParserFragment({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ListViewParserModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RulesCard(title: '基础设置', children: [
          buildInputForm(labelText: '解析器名称', value: model.name),
          buildInputForm(labelText: '项目选择器', value: model.itemSelector),
        ]),
        const SizedBox(height: 5),
        buildCardList([
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
        ], padding: const EdgeInsets.symmetric(horizontal: 5)),
        const SizedBox(height: 5),
        buildCardList([
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
        ], padding: const EdgeInsets.symmetric(horizontal: 5)),
        const SizedBox(height: 5),
        buildCardList([
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
        ], padding: const EdgeInsets.symmetric(horizontal: 5)),
        const SizedBox(height: 5),
        buildCardList([
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
        ], padding: const EdgeInsets.symmetric(horizontal: 5)),
        const SizedBox(height: 5),
        buildCardList([
          RulesForm(
            title: '下一面地址',
            field: '#nextPage',
            selectorModel: model.nextPage,
          ),
        ], padding: const EdgeInsets.symmetric(horizontal: 5)),
      ],
    );
  }
}
