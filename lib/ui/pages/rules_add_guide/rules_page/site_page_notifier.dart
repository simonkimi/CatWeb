import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/ui/widgets/notifier_selector.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';

class SitePageNotifier extends ValueNotifier<SitePageRule>
    with
        _ListTemplateUpdater,
        _SitePageUpdater,
        _AutoCompleteTemplateUpdater,
        _GalleryTemplateUpdater {
  SitePageNotifier(super.rule);

  SitePageRule get rule => value;
}

mixin _SitePageUpdater on ValueNotifier<SitePageRule> {
  void updateSiteName(String name) {
    value = value.copyWith(name: name);
  }

  void updateSiteUrl(String url) {
    value = value.copyWith(url: url);
  }

  void updateSiteAction(SiteNetType action) {
    value = value.copyWith(action: action);
  }

  void updateSiteFormData(String formData) {
    value = value.copyWith(formData: formData);
  }

  void updateSiteIcon(String icon) {
    value = value.copyWith(icon: icon);
  }

  void updateSiteDisplayType(SiteDisplayType displayType) {
    value = value.copyWith(displayType: displayType);
  }

  void updateSiteFlag(String flag) {
    value = value.copyWith(flag: flag);
  }

  void updateSiteParserId(String parserId) {
    value = value.copyWith(parserId: parserId);
  }
}

mixin _ListTemplateUpdater on ValueNotifier<SitePageRule> {
  PageTemplateList get templateList => value.template as PageTemplateList;

  void removeListTemplate(int index) {
    value = value.copyWith(
      template: templateList.copyWith(
        subPages: templateList.subPages.exceptAt(index),
      ),
    );
  }

  void addListTemplate() {
    value = value.copyWith(
      template: templateList.copyWith(
        subPages: templateList.subPages..add(const TemplateListSubPage()),
      ),
    );
  }

  void updateListTemplateSubpage(int key, TemplateListSubPage result) {
    value = value.copyWith(
      template: templateList.copyWith(
        subPages: templateList.subPages..[key] = result,
      ),
    );
  }

  void updateListTemplateTargetItem(String targetItem) {
    value = value.copyWith(
      template: templateList.copyWith(targetItem: targetItem),
    );
  }

  void updateListTemplateTargetAutoComplete(String targetAutoComplete) {
    value = value.copyWith(
      template: templateList.copyWith(targetAutoComplete: targetAutoComplete),
    );
  }

  void updateListTemplateFilter(int key, TemplateListFilterItem result) {
    value = value.copyWith(
      template: templateList.copyWith(
        filter: templateList.filter
            .copyWith(items: templateList.filter.items.replaceAt(key, result)),
      ),
    );
  }

  void addListTemplateFilter() {
    value = value.copyWith(
      template: templateList.copyWith(
        filter: templateList.filter.copyWith(
          items: [
            ...templateList.filter.items,
            const TemplateListFilterItem.string()
          ],
        ),
      ),
    );
  }

  void removeListTemplateFilter(int index) {
    value = value.copyWith(
      template: templateList.copyWith(
        filter: templateList.filter.copyWith(
          items: templateList.filter.items.exceptAt(index),
        ),
      ),
    );
  }
}

mixin _AutoCompleteTemplateUpdater on ValueNotifier<SitePageRule> {
  PageTemplateAutoComplete get templateAutoComplete =>
      value.template as PageTemplateAutoComplete;

  void updateAutoCompleteSplitChar(String splitChar) {
    value = value.copyWith(
      template: templateAutoComplete.copyWith(splitChar: splitChar),
    );
  }

  void updateAutoCompleteTimeout(int timeout) {
    value = value.copyWith(
      template: templateAutoComplete.copyWith(timeout: timeout),
    );
  }
}

mixin _GalleryTemplateUpdater on ValueNotifier<SitePageRule> {
  PageTemplateGallery get templateGallery =>
      value.template as PageTemplateGallery;

  void updateGalleryTargetReader(String targetReader) {
    value = value.copyWith(
      template: templateGallery.copyWith(targetReader: targetReader),
    );
  }
}

typedef SitePageTextField = NotifierTripleTextField<SitePageNotifier>;
