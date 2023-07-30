import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:get/get.dart';

class TemplateGallery implements ITemplate {
  TemplateGallery({
    String targetReader = '',
  })  : targetReader = targetReader.obs,
        type = TemplateType.gallery;

  final RxString targetReader;
  @override
  final TemplateType type;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.value,
      'targetReader': targetReader.value,
    };
  }

  factory TemplateGallery.fromJson(Map<String, dynamic> json) {
    return TemplateGallery(
      targetReader: json['targetReader'],
    );
  }
}
