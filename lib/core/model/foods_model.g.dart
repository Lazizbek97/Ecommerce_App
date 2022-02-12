// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foods_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodsModelAdapter extends TypeAdapter<FoodsModel> {
  @override
  final int typeId = 0;

  @override
  FoodsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodsModel(
      name: fields[0] as String?,
      ingr: fields[1] as String?,
      img: fields[2] as String?,
      price: fields[3] as int?,
      isFavorite: fields[4] as bool?,
      count: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.ingr)
      ..writeByte(2)
      ..write(obj.img)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.isFavorite)
      ..writeByte(5)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
