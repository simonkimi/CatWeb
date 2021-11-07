// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingStore on SettingStoreBase, Store {
  final _$cardSizeAtom = Atom(name: 'SettingStoreBase.cardSize');

  @override
  int get cardSize {
    _$cardSizeAtom.reportRead();
    return super.cardSize;
  }

  @override
  set cardSize(int value) {
    _$cardSizeAtom.reportWrite(value, super.cardSize, () {
      super.cardSize = value;
    });
  }

  final _$useCardWidgetAtom = Atom(name: 'SettingStoreBase.useCardWidget');

  @override
  bool get useCardWidget {
    _$useCardWidgetAtom.reportRead();
    return super.useCardWidget;
  }

  @override
  set useCardWidget(bool value) {
    _$useCardWidgetAtom.reportWrite(value, super.useCardWidget, () {
      super.useCardWidget = value;
    });
  }

  @override
  String toString() {
    return '''
cardSize: ${cardSize},
useCardWidget: ${useCardWidget}
    ''';
  }
}
