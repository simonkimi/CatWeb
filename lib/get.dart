import 'package:catweb/navigator.dart';

T inject<T extends Object>({
  dynamic param1,
  dynamic param2,
  String? instanceName,
  Type? type,
}) {
  return getIt.get<T>(
    param1: param1,
    param2: param2,
    instanceName: instanceName,
    type: type,
  );
}
