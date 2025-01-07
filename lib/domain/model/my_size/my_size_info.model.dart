import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_size_info.model.freezed.dart';
part 'my_size_info.model.g.dart';

@freezed
class MySizeInfo with _$MySizeInfo {
  const factory MySizeInfo({
    //기본 정보
    @Default('') String name,
    @Default(1) int age,
    @Default('') String sex,
    @Default(178.0) double height,
    @Default(68.0) double weight,

    //상의
    @Default(67.2) double upperBodyHeight,
    @Default(39.2) double shoulderWidth,
    @Default(58.6) double armLength,

    //하의
    @Default(100.9) double lowerBodyHeight,
    @Default(25.6) double waistWidth,

    //신발
    @Default(270) int shoesSize,
  }) = _MySizeInfo;

  factory MySizeInfo.fromJson(Map<String, dynamic> json) =>
      _$MySizeInfoFromJson(json);
}
