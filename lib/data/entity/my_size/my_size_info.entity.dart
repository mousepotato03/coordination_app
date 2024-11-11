import 'package:hive_flutter/hive_flutter.dart';

part 'my_size_info.entity.g.dart';

@HiveType(typeId: 0)
class MySizeInfoEntity extends HiveObject {
  //기본 정보
  @HiveField(0, defaultValue: '')
  String name;
  @HiveField(1, defaultValue: 1)
  int age;
  @HiveField(2, defaultValue: '')
  String sex;
  @HiveField(3, defaultValue: 0.0)
  double height;
  @HiveField(4, defaultValue: 0.0)
  double weight;

  //상의
  @HiveField(5, defaultValue: 0.0)
  double upperBodyHeight;
  @HiveField(6, defaultValue: 0.0)
  double shoulderWidth;
  @HiveField(7, defaultValue: 0.0)
  double chestHeight;

  //하의
  @HiveField(8, defaultValue: 0.0)
  double lowerBodyHeight;
  @HiveField(9, defaultValue: 0.0)
  double waistWidth;
  @HiveField(10, defaultValue: 0.0)
  double hipWidth;

  //신발
  @HiveField(11, defaultValue: 0)
  int shoesSize;

  MySizeInfoEntity({
    required this.name,
    required this.age,
    required this.sex,
    required this.height,
    required this.weight,
    required this.upperBodyHeight,
    required this.shoulderWidth,
    required this.chestHeight,
    required this.lowerBodyHeight,
    required this.waistWidth,
    required this.hipWidth,
    required this.shoesSize,
  });
}
