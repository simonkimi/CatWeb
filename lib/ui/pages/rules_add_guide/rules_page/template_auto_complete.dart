import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TemplateAutoCompleteEditor extends HookWidget {
  const TemplateAutoCompleteEditor({
    super.key,
    required this.templateBase,
    required this.onTemplateChanged,
  });

  final TemplateAutoComplete templateBase;
  final void Function(TemplateAutoComplete) onTemplateChanged;

  @override
  Widget build(BuildContext context) {
    final template = useState(templateBase);
    useEffect(() {
      return () => onTemplateChanged(template.value);
    });

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          CupertinoInput(
            labelText: '分隔符',
            value: template.value.splitChar,
            description: '默认为空格',
            onChanged: (value) {
              template.value = template.value.copyWith(splitChar: value);
            },
          ),
          CupertinoInput(
            labelText: '开始搜索时间',
            value: template.value.timeout.toString(),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            description: '当输入等待多久后, 开始搜索 (默认1000毫秒)',
            onChanged: (value) {
              template.value =
                  template.value.copyWith(timeout: int.tryParse(value) ?? 1000);
            },
          ),
        ],
      ),
    );
  }
}
