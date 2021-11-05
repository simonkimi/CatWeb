import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:catweb/ui/components/rules_card.dart';
import 'package:flutter/material.dart';

class ListParser extends StatelessWidget {
  const ListParser({
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
            selectorModel: model.title,
          ),
          RulesForm(
            title: '上传者',
            selectorModel: model.subtitle,
          ),
          RulesForm(
            title: '上传时间',
            selectorModel: model.uploadTIme,
          ),
          RulesForm(
            title: '评分',
            selectorModel: model.star,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
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
        ]),
        const SizedBox(height: 5),
        buildCardList([
          RulesForm(
            title: '分类',
            selectorModel: model.tag,
          ),
          RulesForm(
            title: '分类颜色',
            selectorModel: model.tagColor,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
                buildInputForm(labelText: '徽章选择器', value: model.badgeSelector),
          ),
          RulesForm(
            title: '徽章内容',
            selectorModel: model.badgeText,
          ),
          RulesForm(
            title: '徽章颜色',
            selectorModel: model.badgeColor,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          RulesForm(
            title: '下一面地址',
            selectorModel: model.nextPage,
          ),
        ]),
      ],
    );
  }
}
