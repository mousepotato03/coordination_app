import 'dart:io';

import 'package:coordination_app/data/dto/main_color.model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'image_to_uv_map.api.g.dart';

@RestApi(baseUrl: "http://192.168.219.102:8000")
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
  @POST("/convert/tshirts/color")
  Future<MainColor> exportPantsColor(
    @Part(name: "file") File file,
  );

  @MultiPart()
  @POST("/convert/tshirts/color")
  Future<MainColor> exportShoesColor(
    @Part(name: "file") File file,
  );
}
