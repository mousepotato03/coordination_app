// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_clothes.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyClothesImpl _$$MyClothesImplFromJson(Map<String, dynamic> json) =>
    _$MyClothesImpl(
      id: json['id'] as String,
      imagePath: json['imagePath'] as String,
      category: $enumDecode(_$ClosetCategoryEnumMap, json['category']),
      createdAt: json['createdAt'] as String,
      memo: json['memo'] as String? ?? '',
    );

Map<String, dynamic> _$$MyClothesImplToJson(_$MyClothesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'category': _$ClosetCategoryEnumMap[instance.category]!,
      'createdAt': instance.createdAt,
      'memo': instance.memo,
    };

const _$ClosetCategoryEnumMap = {
  ClosetCategory.top: 'top',
  ClosetCategory.bottom: 'bottom',
  ClosetCategory.outer: 'outer',
  ClosetCategory.shoes: 'shoes',
};
