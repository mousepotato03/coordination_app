import '../../data/response_wrapper/response_wrapper.dart';
import '../model/my_clothes/my_clothes.model.dart';
import '../model/my_size/my_size_info.model.dart';
import 'repository.dart';

abstract class AvatarRepository extends Repository {
  Future<ResponseWrapper<MySizeInfo>> getBodyInfo();

  Future<ResponseWrapper<MyClothes>> getClothesInfoById(String id);
}
