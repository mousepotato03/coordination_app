// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_size_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MySizeInfoImpl _$$MySizeInfoImplFromJson(Map<String, dynamic> json) =>
    _$MySizeInfoImpl(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      upperBodyHeight: (json['upperBodyHeight'] as num).toDouble(),
      shoulderWidth: (json['shoulderWidth'] as num).toDouble(),
      chestHeight: (json['chestHeight'] as num).toDouble(),
      lowerBodyHeight: (json['lowerBodyHeight'] as num).toDouble(),
      waistWidth: (json['waistWidth'] as num).toDouble(),
      hipWidth: (json['hipWidth'] as num).toDouble(),
      shoesSize: (json['shoesSize'] as num).toInt(),
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
