import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class TemplateAutoCompleteFragment extends StatelessWidget {
  const TemplateAutoCompleteFragment({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PageBlueprintModel model;

  @override
  Widget build(BuildContext context) {
    final extra = model.templateData as TemplateAutoCompleteModel;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          CupertinoInput(
            labelText: '分隔符',
            value: extra.splitChar,
            description: '默认为空格',
          ),
          CupertinoInput(
            labelText: '开始搜索时间',
            value: extra.timeout,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            description: '当输入等待多久后, 开始搜索 (默认1000毫秒)',
          ),
        ],
      ),
    );
  }
}
