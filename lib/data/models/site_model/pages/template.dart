import 'package:catweb/data/models/site_model/pages/template_auto_complete.dart';
import 'package:catweb/data/models/site_model/pages/template_gallery.dart';
import 'package:catweb/data/models/site_model/pages/template_image_viewer.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';

enum TemplateType {
  imageList('ImageList'),
  imageWaterFall('ImageWaterFall'),
  gallery('Gallery'),
  imageViewer('ImageViewer'),
  autoComplete('AutoComplete');

  final String value;

  const TemplateType(this.value);

  factory TemplateType.fromJson(String value) {
    return TemplateType.values.firstWhere((e) => e.value == value);
  }
}

abstract class ITemplate {
  final TemplateType type;

  ITemplate(this.type);

  static ITemplate fromJson(Map<String, dynamic> json) {
    final type = TemplateType.fromJson(json['type']);
    return switch (type) {
      TemplateType.gallery => TemplateGallery.fromJson(json),
      TemplateType.imageList ||
      TemplateType.gallery =>
        TemplateList.fromJson(json),
      TemplateType.autoComplete => TemplateAutoComplete.fromJson(json),
      TemplateType.imageViewer => TemplateImageViewer.fromJson(json),
      _ => throw Exception('Invalid template type $type')
    };
  }

  static ITemplate create(TemplateType type) {
    return switch (type) {
      TemplateType.gallery => TemplateGallery(),
      TemplateType.imageList || TemplateType.imageWaterFall => TemplateList(),
      TemplateType.autoComplete => TemplateAutoComplete(),
      TemplateType.imageViewer => TemplateImageViewer(),
    };
  }

  Map<String, dynamic> toJson();
}
