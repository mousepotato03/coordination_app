// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_size_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MySizeInfoImpl _$$MySizeInfoImplFromJson(Map<String, dynamic> json) =>
    _$MySizeInfoImpl(
      name: json['name'] as String? ?? '',
      age: (json['age'] as num?)?.toInt() ?? 1,
      sex: json['sex'] as String? ?? '',
      height: (json['height'] as num?)?.toDouble() ?? 178.0,
      weight: (json['weight'] as num?)?.toDouble() ?? 68.0,
      upperBodyHeight: (json['upperBodyHeight'] as num?)?.toDouble() ?? 67.2,
      shoulderWidth: (json['shoulderWidth'] as num?)?.toDouble() ?? 39.2,
      armLength: (json['armLength'] as num?)?.toDouble() ?? 58.6,
      lowerBodyHeight: (json['lowerBodyHeight'] as num?)?.toDouble() ?? 100.9,
      waistWidth: (json['waistWidth'] as num?)?.toDouble() ?? 25.6,
      shoesSize: (json['shoesSize'] as num?)?.toInt() ?? 270,
    );

Map<String, dynamic> _$$MySizeInfoImplToJson(_$MySizeInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'sex': instance.sex,
      'height': instance.height,
      'weight': instance.weight,
      'upperBodyHeight': instance.upperBodyHeight,
      'shoulderWidth': instance.shoulderWidth,
      'armLength': instance.armLength,
      'lowerBodyHeight': instance.lowerBodyHeight,
      'waistWidth': instance.waistWidth,
      'shoesSize': instance.shoesSize,
    };
