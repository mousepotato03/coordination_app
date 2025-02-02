import 'package:coordination_app/data/response_wrapper/response_wrapper.dart';
import 'package:coordination_app/domain/repository/repository.dart';

abstract class MyOutfitRepository implements Repository {
  Future<ResponseWrapper<String?>> evaluatingOutfits(List<String> imageUrls);
}
