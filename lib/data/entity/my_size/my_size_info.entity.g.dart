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
      height: fields[3] == null ? 0.0 : fields[3] as double,
      weight: fields[4] == null ? 0.0 : fields[4] as double,
      upperBodyHeight: fields[5] == null ? 0.0 : fields[5] as double,
      shoulderWidth: fields[6] == null ? 0.0 : fields[6] as double,
      chestHeight: fields[7] == null ? 0.0 : fields[7] as double,
      lowerBodyHeight: fields[8] == null ? 0.0 : fields[8] as double,
      waistWidth: fields[9] == null ? 0.0 : fields[9] as double,
      hipWidth: fields[10] == null ? 0.0 : fields[10] as double,
      shoesSize: fields[11] == null ? 0 : fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MySizeInfoEntity obj) {
    writer
      ..writeByte(12)
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
      ..write(obj.chestHeight)
      ..writeByte(8)
      ..write(obj.lowerBodyHeight)
      ..writeByte(9)
      ..write(obj.waistWidth)
      ..writeByte(10)
      ..write(obj.hipWidth)
      ..writeByte(11)
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
