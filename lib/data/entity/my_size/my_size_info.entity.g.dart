// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_size_info.entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MySizeInfoEntityAdapter extends TypeAdapter<MySizeInfoEntity> {
  @override
  final int typeId = 0;

  @override
  MySizeInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MySizeInfoEntity(
      name: fields[0] == null ? '' : fields[0] as String,
      age: fields[1] == null ? 1 : fields[1] as int,
      sex: fields[2] == null ? '' : fields[2] as String,
      height: fields[3] == null ? 178.0 : fields[3] as double,
      weight: fields[4] == null ? 68.0 : fields[4] as double,
      upperBodyHeight: fields[5] == null ? 67.2 : fields[5] as double,
      shoulderWidth: fields[6] == null ? 39.2 : fields[6] as double,
      armLength: fields[7] == null ? 58.6 : fields[7] as double,
      lowerBodyHeight: fields[8] == null ? 100.9 : fields[8] as double,
      waistWidth: fields[9] == null ? 25.6 : fields[9] as double,
      shoesSize: fields[10] == null ? 270 : fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MySizeInfoEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.sex)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.upperBodyHeight)
      ..writeByte(6)
      ..write(obj.shoulderWidth)
      ..writeByte(7)
      ..write(obj.armLength)
      ..writeByte(8)
      ..write(obj.lowerBodyHeight)
      ..writeByte(9)
      ..write(obj.waistWidth)
      ..writeByte(10)
      ..write(obj.shoesSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MySizeInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
