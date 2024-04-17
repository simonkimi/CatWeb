// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardSizeAdapter extends TypeAdapter<CardSize> {
  @override
  final int typeId = 1;

  @override
  CardSize read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CardSize.small;
      case 1:
        return CardSize.medium;
      case 2:
        return CardSize.large;
      case 3:
        return CardSize.huge;
      default:
        return CardSize.small;
    }
  }

  @override
  void write(BinaryWriter writer, CardSize obj) {
    switch (obj) {
      case CardSize.small:
        writer.writeByte(0);
        break;
      case CardSize.medium:
        writer.writeByte(1);
        break;
      case CardSize.large:
        writer.writeByte(2);
        break;
      case CardSize.huge:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReaderDirectionAdapter extends TypeAdapter<ReaderDirection> {
  @override
  final int typeId = 2;

  @override
  ReaderDirection read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ReaderDirection.ltr;
      case 1:
        return ReaderDirection.rtl;
      case 2:
        return ReaderDirection.ttb;
      default:
        return ReaderDirection.ltr;
    }
  }

  @override
  void write(BinaryWriter writer, ReaderDirection obj) {
    switch (obj) {
      case ReaderDirection.ltr:
        writer.writeByte(0);
        break;
      case ReaderDirection.rtl:
        writer.writeByte(1);
        break;
      case ReaderDirection.ttb:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReaderDirectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReaderDisplayTypeAdapter extends TypeAdapter<ReaderDisplayType> {
  @override
  final int typeId = 3;

  @override
  ReaderDisplayType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ReaderDisplayType.single;
      case 1:
        return ReaderDisplayType.double;
      case 2:
        return ReaderDisplayType.doubleCover;
      default:
        return ReaderDisplayType.single;
    }
  }

  @override
  void write(BinaryWriter writer, ReaderDisplayType obj) {
    switch (obj) {
      case ReaderDisplayType.single:
        writer.writeByte(0);
        break;
      case ReaderDisplayType.double:
        writer.writeByte(1);
        break;
      case ReaderDisplayType.doubleCover:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReaderDisplayTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SettingModelsImplAdapter extends TypeAdapter<_$SettingModelsImpl> {
  @override
  final int typeId = 0;

  @override
  _$SettingModelsImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SettingModelsImpl(
      defaultSite: fields[0] as int,
      imageMaskInDarkMode: fields[1] as bool,
      cardSize: fields[2] as CardSize,
      preloadCount: fields[3] as int,
      readerDirectory: fields[4] as ReaderDirection,
      displayType: fields[5] as ReaderDisplayType,
      concurrencyCount: fields[6] as int,
      protectCookie: fields[7] as bool,
      blurWhenBackground: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$SettingModelsImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.defaultSite)
      ..writeByte(1)
      ..write(obj.imageMaskInDarkMode)
      ..writeByte(2)
      ..write(obj.cardSize)
      ..writeByte(3)
      ..write(obj.preloadCount)
      ..writeByte(4)
      ..write(obj.readerDirectory)
      ..writeByte(5)
      ..write(obj.displayType)
      ..writeByte(6)
      ..write(obj.concurrencyCount)
      ..writeByte(7)
      ..write(obj.protectCookie)
      ..writeByte(8)
      ..write(obj.blurWhenBackground);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingModelsImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
