import 'package:catweb/data/models/site/template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';

part 'page.g.dart';

@freezed
class SitePage with _$SitePage {
  const SitePage._();

  const factory SitePage({
    @Default('') String name,
    required String uuid,
    required PageTemplate template,
    @Default('') String url,
    @Default(SiteNetType.get) SiteNetType action,
    @Default('') String formData,
    @Default('') String icon,
    @Default(SiteDisplayType.show) SiteDisplayType displayType,
    @Default('') String flag,
    @Default('') String parserId,
  }) = _SitePage;

  factory SitePage.fromJson(Map<String, dynamic> json) =>
      _$SitePageFromJson(json);

  List<String> getDependPage() {
    switch (template) {
      case PageTemplateList(:final targetItem, :final targetAutoComplete):
        return [targetItem, targetAutoComplete];
      default:
        return [];
    }
  }
}

enum SiteNetType {
  @JsonValue('get')
  get,
  @JsonValue('post')
  post,
  @JsonValue('put')
  put,
  @JsonValue('delete')
  delete,
}

enum SiteDisplayType {
  @JsonValue('show')
  show,
  @JsonValue('hide')
  hide,
  @JsonValue('shrink')
  shrink,
  @JsonValue('login')
  login,
}
