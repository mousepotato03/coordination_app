import 'package:hive_flutter/hive_flutter.dart';

part 'my_size_info.entity.g.dart';

@HiveType(typeId: 0)
class MySizeInfoEntity extends HiveObject {
  // 기본 정보
  @HiveField(0, defaultValue: '')
  String name;
  @HiveField(1, defaultValue: 1)
  int age;
  @HiveField(2, defaultValue: '')
  String sex;
  @HiveField(3, defaultValue: 178.0)
  double height;
  @HiveField(4, defaultValue: 68.0)
  double weight;

  // 상의
  @HiveField(5, defaultValue: 67.2)
  double upperBodyHeight;
  @HiveField(6, defaultValue: 39.2)
  double shoulderWidth;
  @HiveField(7, defaultValue: 58.6)
  double armLength;

  // 하의
  @HiveField(8, defaultValue: 100.9)
  double lowerBodyHeight;
  @HiveField(9, defaultValue: 25.6)
  double waistWidth;

  // 신발
  @HiveField(10, defaultValue: 270)
  int shoesSize;

  MySizeInfoEntity({
    this.name = '',
    this.age = 0,
    this.sex = '',
    this.height = 178.0,
    this.weight = 68.0,
    this.upperBodyHeight = 67.2,
    this.shoulderWidth = 39.2,
    this.armLength = 58.6,
    this.lowerBodyHeight = 100.9,
    this.waistWidth = 25.6,
    this.shoesSize = 270,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'sex': sex,
      'height': height,
      'weight': weight,
      'upperBodyHeight': upperBodyHeight,
      'shoulderWidth': shoulderWidth,
      'armLength': armLength,
      'lowerBodyHeight': lowerBodyHeight,
      'waistWidth': waistWidth,
      'shoesSize': shoesSize,
    };
  }
}
