// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_size_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MySizeInfoImpl _$$MySizeInfoImplFromJson(Map<String, dynamic> json) =>
    _$MySizeInfoImpl(
      name: json['name'] as String? ?? '',
      age: (json['age'] as num?)?.toInt() ?? 0,
      sex: json['sex'] as String? ?? '',
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      upperBodyHeight: (json['upperBodyHeight'] as num?)?.toDouble() ?? 0.0,
      shoulderWidth: (json['shoulderWidth'] as num?)?.toDouble() ?? 0.0,
      chestHeight: (json['chestHeight'] as num?)?.toDouble() ?? 0.0,
      lowerBodyHeight: (json['lowerBodyHeight'] as num?)?.toDouble() ?? 0.0,
      waistWidth: (json['waistWidth'] as num?)?.toDouble() ?? 0.0,
      hipWidth: (json['hipWidth'] as num?)?.toDouble() ?? 0.0,
      shoesSize: (json['shoesSize'] as num?)?.toInt() ?? 0,
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
      'chestHeight': instance.chestHeight,
      'lowerBodyHeight': instance.lowerBodyHeight,
      'waistWidth': instance.waistWidth,
      'hipWidth': instance.hipWidth,
      'shoesSize': instance.shoesSize,
    };
