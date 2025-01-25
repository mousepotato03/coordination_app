import 'dart:io';

import 'package:coordination_app/data/data_source/remote/image_to_uv_map.api.dart';
import 'package:coordination_app/data/mapper/common.mapper.dart';
import 'package:coordination_app/data/mapper/my_clothes_mapper.dart';
import 'package:coordination_app/presentation/main/bottom_sheet/closet/closet_category.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/utils/logger.dart';
import '../../domain/model/my_clothes/my_clothes.model.dart';
import '../../domain/repository/my_closet.repository.dart';
import '../data_source/local/my_closet.dao.dart';
import '../response_wrapper/response_wrapper.dart';

@Singleton(as: MyClosetRepository)
class MyClosetRepositoryImpl implements MyClosetRepository {
  final MyClosetDao _myClosetDao;
  final ImageToUvMapApi _imageToUVmapApi;

  MyClosetRepositoryImpl(this._myClosetDao, this._imageToUVmapApi);

  @override
  Future<ResponseWrapper<List<MyClothes>>> getMyCloset() async {
    final response = await _myClosetDao.getMyCloset();
    return response.toModel<List<MyClothes>>(
      response.data?.map((e) => e.toModel()).toList() ?? [],
    );
  }

  @override
  Future<ResponseWrapper<List<MyClothes>>> addMyClothes(
      MyClothes clothes) async {
    final response = await _myClosetDao.addMyClothes(clothes.toEntity());
    return response.toModel<List<MyClothes>>(
      response.data?.map((e) => e.toModel()).toList() ?? [],
    );
  }

  @override
  Future<ResponseWrapper<List<MyClothes>>> deleteMyClothes(
      List<String> ids) async {
    final response = await _myClosetDao.deleteMyClothes(ids);
    return response.toModel<List<MyClothes>>(
      response.data?.map((e) => e.toModel()).toList() ?? [],
    );
  }

  @override
  Future<ResponseWrapper<String>> convertTshirts2UVmap(String imagePath) async {
    try {
      final image = File(imagePath);

      // API 호출하여 바이너리 데이터를 직접 받음
      final bytes = await _imageToUVmapApi.convertTshirts2UVmap(image);

      // 이미지 저장 경로 설정
      final appDir = await getApplicationCacheDirectory();
      final fileName =
          'tshirts_uv_map_${DateTime.now().millisecondsSinceEpoch}.png';
      final filePath = '${appDir.path}/$fileName';

      // 바이너리 데이터를 직접 파일로 저장
      await File(filePath).writeAsBytes(bytes);

      return ResponseWrapper(status: "SUCCESS", data: filePath);
    } catch (e) {
      CustomLogger.logger.e("이미지 변환 실패: $e");
      return ResponseWrapper(status: "ERROR", data: e.toString());
    }
  }

  @override
  Future<ResponseWrapper<String>> exportMainColor(
      ClosetCategory category, String imagePath) async {
    try {
      final image = File(imagePath);

      final response = switch (category) {
        ClosetCategory.top => await _imageToUVmapApi.exportTshirtsColor(image),
        ClosetCategory.bottom => await _imageToUVmapApi.exportPantsColor(image),
        ClosetCategory.shoes => await _imageToUVmapApi.exportShoesColor(image),
      };

      final mainColor = response.mainColor;

      return ResponseWrapper(
        status: "SUCCESS",
        data: mainColor,
      );
    } catch (e) {
      return ResponseWrapper(
        status: "ERROR",
        message: '색상 추출 중 오류가 발생했습니다: ${e.toString()}',
      );
    }
  }
}
