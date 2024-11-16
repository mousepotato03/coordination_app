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
    this.name = '',
    this.age = 1,
    this.sex = '',
    this.height = 0.0,
    this.weight = 0.0,
    this.upperBodyHeight = 0.0,
    this.shoulderWidth = 0.0,
    this.chestHeight = 0.0,
    this.lowerBodyHeight = 0.0,
    this.waistWidth = 0.0,
    this.hipWidth = 0.0,
    this.shoesSize = 0,
  });
}
