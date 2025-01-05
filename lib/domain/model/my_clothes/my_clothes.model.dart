import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../presentation/main/bottom_sheet/closet/closet_category.dart';

part 'my_clothes.model.freezed.dart';
part 'my_clothes.model.g.dart';

@freezed
class MyClothes with _$MyClothes {
  const factory MyClothes({
    required String id,
    required String imagePath,
    required ClosetCategory category,
    required String createdAt,
    @Default('') String memo,
  }) = _MyClothes;

  factory MyClothes.fromJson(Map<String, dynamic> json) =>
      _$MyClothesFromJson(json);
}
