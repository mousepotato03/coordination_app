import 'package:hive_flutter/hive_flutter.dart';

part 'my_clothes.entity.g.dart';

@HiveType(typeId: 1)
class MyClothesEntity extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String imagePath;

  @HiveField(2)
  final String? uvMapPath;

  @HiveField(3)
  final String? mainColor;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final String createdAt;

  @HiveField(6, defaultValue: '')
  final String memo;

  MyClothesEntity({
    required this.id,
    required this.imagePath,
    this.uvMapPath,
    this.mainColor,
    required this.category,
    required this.createdAt,
    this.memo = '',
  });
}
