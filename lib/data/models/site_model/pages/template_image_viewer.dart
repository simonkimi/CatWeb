import 'package:catweb/data/models/site_model/pages/template.dart';

class TemplateImageViewer implements ITemplate {
  TemplateImageViewer() : type = TemplateType.imageViewer;
  @override
  final TemplateType type;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.value,
    };
  }

  factory TemplateImageViewer.fromJson(Map<String, dynamic> json) {
    return TemplateImageViewer();
  }
}
