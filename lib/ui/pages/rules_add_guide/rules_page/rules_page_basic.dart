import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/utils/helper.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class RulesPageBasic extends HookWidget {
  const RulesPageBasic({
    super.key,
    required this.sitePage,
    required this.onModelChanged,
  });

  final SitePage sitePage;
  final Function(SitePage) onModelChanged;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RulesEditController>();
    final model = useState(sitePage);
    useState(() {
      return () => onModelChanged(model.value);
    });

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          CupertinoInput(
            labelText: I.of(context).name,
            value: model.value.name,
            onChanged: (value) {
              model.value = model.value.copyWith(name: value);
            },
          ),
          CupertinoInput(
            labelText: I.of(context).website,
            value: model.value.url,
            onChanged: (value) {
              model.value = model.value.copyWith(url: value);
            },
          ),
          CupertinoReadOnlyInput(
            labelText: I.of(context).net_action,
            value: model.value.action.value,
            onTap: () => _onNetActionTap(context),
          ),
          if (model.value.action == SiteActionType.post)
            CupertinoInput(
              labelText: I.of(context).form,
              value: model.value.formData,
              minLine: 4,
              onChanged: (value) {
                model.value = model.value.copyWith(formData: value);
              },
            ),
          CupertinoReadOnlyInput(
            labelText: I.of(context).parser,
            value: controller.blueprint.parserList
                    .get((e) => e.uuid == model.value.parserId)
                    ?.name ??
                'No parser',
            onTap: () => _onParserTap(context),
          ),
          const CupertinoDivider(height: 20),
          if ([TemplateType.imageWaterFall, TemplateType.imageList]
              .contains(model.value.template?.type))
            CupertinoReadOnlyInput(
              labelText: I.of(context).display_type,
              value: model.value.displayType.value,
              onTap: () => _onDisplayTap(context),
            ),
          _buildIcon(model, context),
          _buildOpenNewPage(model, context),
        ],
      ),
    );
  }

  Widget _buildOpenNewPage(
      ValueNotifier<SitePage> model, BuildContext context) {
    late final List<Widget> body;

    if (model.value.template == null) {
      body = [];
    } else {
      switch (model.value.template!.type) {
        case TemplateType.autoComplete:
        case TemplateType.imageViewer:
          body = [];
          break;

        case TemplateType.imageList:
        case TemplateType.imageWaterFall:
          final extra = model.value.template as TemplateList;
          body = [
            _buildOpenWidget(
              context,
              labelText: I.of(context).item_jump_to,
              target: extra.targetItem,
            ),
            _buildOpenWidget(
              context,
              labelText: I.of(context).auto_complete_jump_to,
              target: extra.targetAutoComplete,
              filter: (item) =>
                  item.template.value == TemplateType.autoComplete,
            ),
          ];
          break;
        case TemplateType.gallery:
          final extra = model.value.template as TemplateGallery;
          body = [
            _buildOpenWidget(
              context,
              labelText: I.of(context).read_jump_to,
              target: extra.targetReader,
              filter: (item) => item.template.value == TemplateType.imageViewer,
            ),
          ];
          break;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...body,
        ],
      ),
    );
  }

  Widget _buildIcon(ValueNotifier<SitePage> model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            I.of(context).icon,
            style: TextStyle(
                color: FixColor.title.resolveFrom(context), fontSize: 13),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              CupertinoButton(
                color: CupertinoColors.systemGroupedBackground
                    .resolveFrom(context),
                padding: EdgeInsets.zero,
                child: Obx(() => Icon(
                      cupertinoIcons[model.value.icon] ?? CupertinoIcons.app,
                      color: CupertinoColors.systemBlue.resolveFrom(context),
                    )),
                onPressed: () async {
                  final result = await showCupertinoIconDialog(context);
                  if (result != null && result.isNotEmpty) {
                    model.value = model.value.copyWith(icon: result);
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
    final result = await showCupertinoSelectDialog<String>(
      title: I.of(context).select_parser,
      context: context,
      items: model.template.value
          .parser(controller.blueprint.parsers)
          .map((e) => SelectTileItem(title: e.name.value, value: e.uuid))
          .toList(),
      cancelText: I.of(context).negative,
    );
    if (result != null) {
      model.baseParser.value = result;
    }
  }

  Future<void> _onNetActionTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<NetActionType>(
      title: I.of(context).select_net_action,
      context: context,
      items: NetActionType.values
          .map((e) => SelectTileItem(title: e.string, value: e))
          .toList(),
      cancelText: I.of(context).negative,
    );
    if (result != null) {
      model.netAction.value = result;
    }
  }

  Widget _buildOpenWidget(
    BuildContext context, {
    required String labelText,
    required String target,
    bool Function(PageBlueprintModel)? filter,
  }) {
    return Obx(() => CupertinoReadOnlyInput(
          labelText: labelText,
          value: controller.blueprint.getPageName(target.value),
          onTap: () => showCupertinoSelectDialog(
            context: context,
            items: [
              ...controller.blueprint.pageList
                  .where((e) => filter != null ? filter(e) : true)
                  .map((e) => SelectTileItem(
                        title: e.name.string,
                        value: e.uuid,
                      )),
              SelectTileItem(title: I.of(context).none, value: ''),
            ],
          ).then((value) {
            if (value != null) {
              target.value = value;
            }
          }),
        ));
  }

  Future<void> _onDisplayTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<SiteDisplayType>(
      title: I.of(context).display_type,
      context: context,
      items: SiteDisplayType.values
          .map((e) => SelectTileItem<SiteDisplayType>(
              title: e.string(context), value: e))
          .toList(),
      cancelText: I.of(context).negative,
    );

    if (result != null) {
      model.display.value = result;
    }
  }
}
