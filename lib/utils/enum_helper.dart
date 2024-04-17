abstract class EnumWithValue {
  final int value;

  EnumWithValue(this.value);
}

T enumFromValue<T extends EnumWithValue>(List<T> values, int value) {
  for (var item in values) {
    if (item.value == value) {
      return item;
    }
  }
  throw Exception('Unknown value: $value');
}
