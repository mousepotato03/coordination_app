import 'dart:io';

import 'package:coordination_app/data/response_wrapper/response_wrapper.dart';
import 'package:coordination_app/domain/repository/repository.dart';

abstract class MyOutfitRepository extends Repository {
  Future<ResponseWrapper<String>> evaluatingOutfit(List<String> imageIds);

  Future<String> uploadFile(File file);
}
