import 'package:coordination_app/data/mapper/common.mapper.dart';
import 'package:coordination_app/data/mapper/my_clothes_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/my_clothes/my_clothes.model.dart';
import '../../domain/repository/my_closet.repository.dart';
import '../data_source/local/my_closet.dao.dart';
import '../response_wrapper/response_wrapper.dart';

@Singleton(as: MyClosetRepository)
class MyClosetRepositoryImpl implements MyClosetRepository {
  final MyClosetDao _myClosetDao;

  MyClosetRepositoryImpl(this._myClosetDao);

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
  Future<ResponseWrapper<List<MyClothes>>> modifyMyClothes(
      String id, MyClothes clothes) async {
    final response = await _myClosetDao.modifyMyClothes(id, clothes.toEntity());
    return response.toModel<List<MyClothes>>(
      response.data?.map((e) => e.toModel()).toList() ?? [],
    );
  }
}
