import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_size_info.model.freezed.dart';
part 'my_size_info.model.g.dart';

@freezed
class MySizeInfo with _$MySizeInfo {
  const factory MySizeInfo({
    //기본 정보
    required String name,
    required int age,
    required String sex,
    required double height,
    required double weight,

    //상의
    required double upperBodyHeight,
    required double shoulderWidth,
    required double chestHeight,

    //하의
    required double lowerBodyHeight,
    required double waistWidth,
    required double hipWidth,

    //신발
    required int shoesSize,
  }) = _MySizeInfo;

  factory MySizeInfo.fromJson(Map<String, dynamic> json) =>
      _$MySizeInfoFromJson(json);
}
