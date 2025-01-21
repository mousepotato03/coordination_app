import '../../domain/model/my_clothes/my_clothes.model.dart';
import '../../presentation/main/bottom_sheet/closet/closet_category.dart';
import '../entity/my_clothes/my_clothes.entity.dart';

//model => entity
extension MyClothesEx on MyClothes {
  MyClothesEntity toEntity() {
    return MyClothesEntity(
      id: id,
      imagePath: imagePath,
      uvMapPath: uvMapPath,
      mainColor: mainColor,
      category: category.name,
      createdAt: createdAt,
      memo: memo,
    );
  }
}

//entity => model
extension MyClothesEntityEX on MyClothesEntity {
  MyClothes toModel() {
    return MyClothes(
      id: id,
      imagePath: imagePath,
      uvMapPath: uvMapPath,
      mainColor: mainColor,
      category: ClosetCategory.values.firstWhere((e) => e.name == category),
      createdAt: createdAt,
      memo: memo,
    );
  }
}
