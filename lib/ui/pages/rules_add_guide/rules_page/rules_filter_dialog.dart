import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';

class RulesFilterDialog extends StatefulWidget {
  const RulesFilterDialog({
    super.key,
    required this.field,
  });

  final TemplateListFilterItem field;

  @override
  State<RulesFilterDialog> createState() => _RulesFilterDialogState();
}

class _RulesFilterDialogState extends State<RulesFilterDialog> {
  late String name;
  late String key;
  late FilterType type;
  late Object defaultValue;

  @override
  void initState() {
    super.initState();
    type = widget.field.type;
    name = widget.field.name;
    key = widget.field.key;
  }

  TemplateListFilterItem popResult() {
    return switch (type) {
      FilterType.int => TemplateListFilterItem.int(
          name: name,
          key: key,
          defaultValue: defaultValue as int,
        ),
      FilterType.float => TemplateListFilterItem.float(
          name: name,
          key: key,
          defaultValue: defaultValue as double,
        ),
      FilterType.string => TemplateListFilterItem.string(
          name: name,
          key: key,
          defaultValue: defaultValue as String,
        ),
      FilterType.bool => TemplateListFilterItem.bool(
          name: name,
          key: key,
          defaultValue: defaultValue as bool,
        )
    };
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      actions: [
        CupertinoDialogAction(
          child: Text(I.of(context).save),
          onPressed: () => context.pop(popResult()),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () => context.pop(),
          child: Text(I.of(context).negative),
        ),
      ],
      content: Column(
        children: [
          TripleTextField(
            labelText: I.of(context).name,
            value: widget.field.name,
            onSubmitted: (value) {
              name = value;
            },
          ),
          TripleTextField(
            labelText: I.of(context).key,
            value: widget.field.key,
            onSubmitted: (value) {
              key = value;
            },
          ),
          TripleReadonlyTextField(
            labelText: I.of(context).type,
            value: type.getDescription(context),
            onTap: () async {
              final type = await showCupertinoSelectDialog<FilterType>(
                context: context,
                items: FilterType.values.map((e) {
                  return SelectTileItem(
                    title: e.getDescription(context),
                    value: e,
                  );
                }).toList(),
                cancelText: I.of(context).negative,
              );
              if (type == null) return;
              setState(() {
                this.type = type;
              });
            },
          ),
          switch (type) {
            FilterType.int => TripleIntField(
                labelText: I.of(context).default_value,
                value: defaultValue as int,
                onSubmitted: (value) {
                  defaultValue = value;
                },
              ),
            FilterType.float => TripleDoubleField(
                labelText: I.of(context).default_value,
                value: defaultValue as double,
                onSubmitted: (value) {
                  defaultValue = value;
                },
              ),
            FilterType.string => TripleTextField(
                labelText: I.of(context).default_value,
                value: defaultValue as String,
                onSubmitted: (value) {
                  defaultValue = value;
                },
              ),
            FilterType.bool => TripleBoolField(
                labelText: I.of(context).default_value,
                value: defaultValue as bool,
                onSubmitted: (value) {
                  defaultValue = value;
                },
              ),
          }
        ],
      ),
    );
  }
}
