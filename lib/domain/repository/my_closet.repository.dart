import '../../data/response_wrapper/response_wrapper.dart';
import '../../presentation/main/bottom_sheet/closet/closet_category.dart';
import '../model/my_clothes/my_clothes.model.dart';
import 'repository.dart';

abstract class MyClosetRepository extends Repository {
  Future<ResponseWrapper<List<MyClothes>>> getMyCloset();

  Future<ResponseWrapper<List<MyClothes>>> addMyClothes(MyClothes clothes);

  Future<ResponseWrapper<List<MyClothes>>> deleteMyClothes(List<String> ids);

  Future<ResponseWrapper<String>> convertTshirts2UVmap(String imagePath);

  Future<ResponseWrapper<String>> exportMainColor(
    ClosetCategory category,
    String imagePath,
  );
}
