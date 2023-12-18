enum CardSize {
  small(100),
  medium(150),
  large(200),
  huge(300);

  final int size;

  const CardSize(this.size);

  static CardSize from(int value) {
    return switch (value) {
      100 => CardSize.small,
      150 => CardSize.medium,
      200 => CardSize.large,
      300 => CardSize.huge,
      _ => throw Exception('Unknown value: $value')
    };
  }
}

enum ReaderDirection {
  ltr(0),
  rtl(1),
  ttb(2);

  final int direction;

  const ReaderDirection(this.direction);

  static ReaderDirection from(int value) {
    return switch (value) {
      0 => ReaderDirection.ltr,
      1 => ReaderDirection.rtl,
      2 => ReaderDirection.ttb,
      _ => throw Exception('Unknown value: $value')
    };
  }
}

enum ReaderDisplayType {
  single(0), // 单面情况
  double(1), // 双面情况
  doubleCover(2); // 封面单独占一面的双面情况

  final int value;

  const ReaderDisplayType(this.value);

  static ReaderDisplayType from(int value) {
    return switch (value) {
      0 => ReaderDisplayType.single,
      1 => ReaderDisplayType.double,
      2 => ReaderDisplayType.doubleCover,
      _ => throw Exception('Unknown value: $value')
    };
  }
}
