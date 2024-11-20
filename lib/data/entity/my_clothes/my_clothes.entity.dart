import 'package:hive_flutter/hive_flutter.dart';
import '../../../presentation/pages/closet/closet_category.dart';

part 'my_clothes.entity.g.dart';

@HiveType(typeId: 1)
class MyClothesEntity extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String imagePath;

  @HiveField(2)
  final ClosetCategory category;

  @HiveField(3)
  final DateTime createdAt;

  @HiveField(4, defaultValue: '')
  final String memo;

  MyClothesEntity({
    required this.id,
    required this.imagePath,
    required this.category,
    required this.createdAt,
    this.memo = '',
  });
}
