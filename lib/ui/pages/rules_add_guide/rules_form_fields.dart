import 'package:flutter/cupertino.dart';

class RuleFormPage extends StatelessWidget {
  const RuleFormPage({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: children,
    );
  }
}

class RuleSectionTitle extends StatelessWidget {
  const RuleSectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        text,
        style: TextStyle(
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class RuleTextField extends StatelessWidget {
  const RuleTextField({
    required this.label,
    required this.controller,
    super.key,
    this.placeholder,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
  });

  final String label;
  final TextEditingController controller;
  final String? placeholder;
  final TextInputType? keyboardType;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 5),
          CupertinoTextField(
            controller: controller,
            placeholder: placeholder,
            keyboardType: keyboardType,
            maxLines: maxLines,
            onChanged: onChanged,
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
          ),
        ],
      ),
    );
  }
}

class RuleSelectField extends StatelessWidget {
  const RuleSelectField({
    required this.label,
    required this.value,
    required this.onPressed,
    super.key,
  });

  final String label;
  final String value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 5),
          CupertinoButton(
            color: CupertinoColors.systemGrey6.resolveFrom(context),
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
            onPressed: onPressed,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(
                      color: CupertinoColors.label.resolveFrom(context),
                      fontSize: 15,
                    ),
                  ),
                ),
                const Icon(CupertinoIcons.chevron_down, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RuleSwitchField extends StatelessWidget {
  const RuleSwitchField({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 15))),
          CupertinoSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class RuleKeyValueEditor extends StatefulWidget {
  const RuleKeyValueEditor({
    required this.label,
    required this.initialValue,
    required this.onChanged,
    super.key,
  });

  final String label;
  final Map<String, Object?> initialValue;
  final ValueChanged<Map<String, Object?>> onChanged;

  @override
  State<RuleKeyValueEditor> createState() => _RuleKeyValueEditorState();
}

class _RuleKeyValueEditorState extends State<RuleKeyValueEditor> {
  late final List<_EntryControllers> entries;

  @override
  void initState() {
    super.initState();
    entries = widget.initialValue.entries
        .map(
          (entry) => _EntryControllers(
            keyText: entry.key,
            valueText: entry.value?.toString() ?? '',
          ),
        )
        .toList();
  }

  void _notify() {
    widget.onChanged({
      for (final entry in entries)
        if (entry.key.text.trim().isNotEmpty)
          entry.key.text.trim(): entry.value.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: RuleSectionTitle(widget.label)),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => setState(() {
                entries.add(_EntryControllers());
              }),
              child: const Icon(CupertinoIcons.add_circled),
            ),
          ],
        ),
        if (entries.isEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              '无',
              style: TextStyle(
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
                fontSize: 14,
              ),
            ),
          ),
        for (var index = 0; index < entries.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    controller: entries[index].key,
                    placeholder: '名称',
                    onChanged: (_) => _notify(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CupertinoTextField(
                    controller: entries[index].value,
                    placeholder: '值',
                    onChanged: (_) => _notify(),
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.only(left: 8),
                  minimumSize: Size.zero,
                  onPressed: () => setState(() {
                    entries.removeAt(index).dispose();
                    _notify();
                  }),
                  child: const Icon(
                    CupertinoIcons.minus_circle,
                    color: CupertinoColors.systemRed,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    for (final entry in entries) {
      entry.dispose();
    }
    super.dispose();
  }
}

class _EntryControllers {
  _EntryControllers({String keyText = '', String valueText = ''})
    : key = TextEditingController(text: keyText),
      value = TextEditingController(text: valueText);

  final TextEditingController key;
  final TextEditingController value;

  void dispose() {
    key.dispose();
    value.dispose();
  }
}
