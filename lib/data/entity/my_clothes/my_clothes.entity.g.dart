// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_clothes.entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyClothesEntityAdapter extends TypeAdapter<MyClothesEntity> {
  @override
  final int typeId = 1;

  @override
  MyClothesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyClothesEntity(
      id: fields[0] as String,
      imagePath: fields[1] as String,
      category: fields[2] as ClosetCategory,
      createdAt: fields[3] as DateTime,
      memo: fields[4] == null ? '' : fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyClothesEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.memo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyClothesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
