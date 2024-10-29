import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_notifier.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/site_page_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/ui/widgets/notifier_selector.dart';
import 'package:catweb/utils/icons.dart';
import 'package:catweb/utils/iter_helper.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RulesPageBasic extends StatelessWidget {
  const RulesPageBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          NotifierTripleTextField<SitePageNotifier>(
            labelText: I.of(context).name,
            selector: (n) => n.rule.name,
            save: (n) => n.updateSiteName,
          ),
          NotifierTripleTextField<SitePageNotifier>(
            labelText: I.of(context).website,
            selector: (n) => n.rule.url,
            save: (n) => n.updateSiteUrl,
          ),
          NotifierTripleEnumField<SitePageNotifier, SiteNetType>(
            selector: (n) => n.rule.action,
            labelText: I.of(context).net_action,
            save: (n) => n.updateSiteAction,
            items: SiteNetType.values.map((e) {
              return SelectTileItem(title: e.getDescription(context), value: e);
            }),
          ),
          Selector<SitePageNotifier, SiteNetType>(
            selector: (_, n) => n.rule.action,
            child: NotifierTripleTextField<SitePageNotifier>(
              labelText: I.of(context).form,
              selector: (n) => n.rule.formData,
              save: (n) => n.updateSiteFormData,
            ),
            builder: (_, action, child) {
              return switch (action) {
                SiteNetType.post || SiteNetType.put => child!,
                _ => const SizedBox(),
              };
            },
          ),
          Selector2<
              SitePageNotifier,
              RulesEditorNotifier,
              ({
                List<ParserModel> parserList,
                String parserId,
              })>(
            selector: (_, pageNotifier, ruleNotifier) => (
              parserList: ruleNotifier.blueprint.parserList,
              parserId: pageNotifier.rule.parserId,
            ),
            builder: (_, value, __) {
              return TripleReadonlyTextField(
                labelText: I.of(context).parser,
                value: value.parserList
                        .firstWhereOrNull((e) => e.uuid == value.parserId)
                        ?.name ??
                    'No parser',
                onTap: () => _onParserTap(context),
              );
            },
          ),
          const CupertinoDivider(height: 20),
          NotifierTripleEnumField<SitePageNotifier, SiteDisplayType>(
            selector: (n) => n.rule.displayType,
            labelText: I.of(context).display_type,
            items: SiteDisplayType.values.map((e) {
              return SelectTileItem(title: e.getDescription(context), value: e);
            }),
            save: (n) => n.updateSiteDisplayType,
          ),
          _buildIcon(context),
          _buildOpenNewPage(context),
        ],
      ),
    );
  }

  Widget _buildOpenNewPage(
    BuildContext context,
  ) {
    final notifier = context.read<SitePageNotifier>();
    List<Widget> body = switch (notifier.rule.template) {
      PageTemplateAutoComplete() || PageTemplateImageViewer() => [],
      PageTemplateList(:final targetItem, :final targetAutoComplete) => [
          _OpenPageSelector(
            labelText: I.of(context).item_jump_to,
            target: targetItem,
            onTargetChanged: (value) {
              notifier.updateListTemplateTargetItem(value ?? '');
            },
          ),
          _OpenPageSelector(
            labelText: I.of(context).auto_complete_jump_to,
            target: targetAutoComplete,
            filter: (item) => item.template is PageTemplateAutoComplete,
            onTargetChanged: (value) {
              notifier.updateListTemplateTargetAutoComplete(value ?? '');
            },
          ),
        ],
      PageTemplateGallery(:final targetReader) => [
          _OpenPageSelector(
            labelText: I.of(context).read_jump_to,
            target: targetReader,
            filter: (item) => item.template is PageTemplateImageViewer,
            onTargetChanged: (value) {
              notifier.updateGalleryTargetReader(value ?? '');
            },
          ),
        ],
      PageTemplate() => throw UnimplementedError(),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: body,
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            I.of(context).icon,
            style: TextStyle(
              color: FixColor.title.resolveFrom(context),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              CupertinoButton(
                color: CupertinoColors.systemGroupedBackground
                    .resolveFrom(context),
                padding: EdgeInsets.zero,
                child: Selector<SitePageNotifier, String>(
                  selector: (_, n) => n.rule.icon,
                  builder: (_, icon, __) {
                    return Icon(
                      cupertinoIcons[icon] ?? CupertinoIcons.app,
                      color: CupertinoColors.systemBlue.resolveFrom(context),
                    );
                  },
                ),
                onPressed: () async {
                  final result = await showCupertinoIconDialog(context);
                  if (result != null && result.isNotEmpty) {
                    final notifier = context.read<SitePageNotifier>();
                    notifier.updateSiteIcon(result);
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> _onParserTap(BuildContext context) async {
    final rulesEditorNotifier = context.read<RulesEditorNotifier>();
    final sitePageNotifier = context.read<SitePageNotifier>();

    final result = await showCupertinoSelectDialog<String>(
      title: I.of(context).select_parser,
      context: context,
      items: rulesEditorNotifier.value.parserList
          .where((e) => e.type == sitePageNotifier.rule.acceptParserType())
          .map((e) => SelectTileItem(title: e.name, value: e.uuid))
          .toList(),
      cancelText: I.of(context).negative,
    );
    if (result != null) {
      sitePageNotifier.updateSiteParserId(result);
    }
  }
}

class _OpenPageSelector extends StatelessWidget {
  const _OpenPageSelector({
    required this.labelText,
    required this.target,
    this.filter,
    required this.onTargetChanged,
  });

  final String labelText;
  final String target;
  final bool Function(SitePageRule)? filter;
  final void Function(String?) onTargetChanged;

  @override
  Widget build(BuildContext context) {
    return Selector<RulesEditorNotifier, List<SitePageRule>>(
      selector: (_, n) => n.blueprint.pageList,
      builder: (_, pageList, __) {
        return TripleReadonlyTextField(
          labelText: labelText,
          value: pageList.firstWhereOrNull((e) => e.uuid == target)?.name ??
              I.of(context).none,
          onTap: () async {
            final result = await showCupertinoSelectDialog(
              context: context,
              items: [
                ...pageList.where((e) => filter?.call(e) ?? true).map((e) {
                  return SelectTileItem(
                    title: e.name,
                    value: e.uuid,
                  );
                }),
                SelectTileItem(title: I.of(context).none, value: ''),
              ],
            );
            onTargetChanged(result);
          },
        );
      },
    );
  }
}
