import 'package:catweb/data/models/site_model/pages/template_auto_complete.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TemplateAutoCompleteEditor extends HookWidget {
  const TemplateAutoCompleteEditor({
    super.key,
    required this.templateBase,
  });

  final TemplateAutoComplete templateBase;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          CupertinoInput(
            labelText: '分隔符',
            value: templateBase.splitChar,
            description: '默认为空格',
          ),
          CupertinoNumberInput(
            labelText: '开始搜索时间',
            value: templateBase.timeout,
            description: '当输入等待多久后, 开始搜索 (默认1000毫秒)',
          ),
        ],
      ),
    );
  }
}
