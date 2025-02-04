import 'dart:io';

import 'package:coordination_app/core/secure_key.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../dto/image_to_uv_map/main_color.dto.dart';

part 'image_to_uv_map.api.g.dart';

@RestApi(baseUrl: localServerAddress)
abstract class ImageToUvMapApi {
  factory ImageToUvMapApi(Dio dio) = _ImageToUvMapApi;

  @MultiPart()
  @POST("/convert/tshirts/uv")
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> convertTshirts2UVmap(
    @Part(name: "file") File file,
  );

  @MultiPart()
  @POST("/convert/tshirts/color")
  Future<MainColor> exportTshirtsColor(
    @Part(name: "file") File file,
  );

  @MultiPart()
  @POST("/convert/pants/color")
  Future<MainColor> exportPantsColor(
    @Part(name: "file") File file,
  );

  @MultiPart()
  @POST("/convert/shoes/color")
  Future<MainColor> exportShoesColor(
    @Part(name: "file") File file,
  );
}
