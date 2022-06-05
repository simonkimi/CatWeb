import 'package:yaml/yaml.dart';


void main() {
  var doc = loadYaml("YAML: YAML Ain't Markup Language");
  print(doc);
}