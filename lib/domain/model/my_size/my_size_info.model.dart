import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_size_info.model.freezed.dart';
part 'my_size_info.model.g.dart';

@freezed
class MySizeInfo with _$MySizeInfo {
  const factory MySizeInfo({
    //기본 정보
    @Default('') String name,
    @Default(0) int age,
    @Default('') String sex,
    @Default(0.0) double height,
    @Default(0.0) double weight,

    //상의
    @Default(0.0) double upperBodyHeight,
    @Default(0.0) double shoulderWidth,
    @Default(0.0) double chestHeight,

    //하의
    @Default(0.0) double lowerBodyHeight,
    @Default(0.0) double waistWidth,
    @Default(0.0) double hipWidth,

    //신발
    @Default(0) int shoesSize,
  }) = _MySizeInfo;

  factory MySizeInfo.fromJson(Map<String, dynamic> json) =>
      _$MySizeInfoFromJson(json);
}
