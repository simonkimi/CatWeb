import 'package:catweb/navigator.dart';
import 'package:riverpod/riverpod.dart';

// T get<T extends Object>({
//   dynamic param1,
//   dynamic param2,
//   String? instanceName,
//   Type? type,
// }) {
//   return getIt.get<T>(
//       param1: param1, param2: param2, instanceName: instanceName, type: type);
// }

T inject<T>(ProviderListenable<T> provider) {
  return getIt.get<ProviderContainer>().read(provider);
}
