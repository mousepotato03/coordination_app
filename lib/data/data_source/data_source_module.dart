import 'package:coordination_app/data/data_source/remote/image_to_uv_map.api.dart';
import 'package:coordination_app/data/data_source/remote/openai.api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/rest_client/rest_client.dart';
import 'local/my_closet.dao.dart';
import 'local/my_size_info.dao.dart';

@module
abstract class DataSourceModule {
  final Dio _dio = RestClient().getDio;

  @singleton
  MySizeDao get mySizeDao => MySizeDao();

  @singleton
  MyClosetDao get myClosetDao => MyClosetDao();

  @singleton
  ImageToUvMapApi get imageToUvMapApi => ImageToUvMapApi(_dio);

  @singleton
  OpenAiApi get openAiApi => OpenAiApi(_dio);
}
