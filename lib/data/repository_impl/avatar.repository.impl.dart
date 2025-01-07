import 'package:coordination_app/data/mapper/common.mapper.dart';
import 'package:coordination_app/data/mapper/my_clothes_mapper.dart';
import 'package:coordination_app/data/mapper/my_size_info.mapper.dart';
import 'package:coordination_app/domain/model/my_clothes/my_clothes.model.dart';
import 'package:coordination_app/domain/repository/avatar.repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/my_size/my_size_info.model.dart';
import '../data_source/local/my_closet.dao.dart';
import '../data_source/local/my_size_info.dao.dart';
import '../response_wrapper/response_wrapper.dart';

@Singleton(as: AvatarRepository)
class AvatarRepositoryImpl implements AvatarRepository {
  final MySizeDao _mySizeDao;
  final MyClosetDao _myClosetDao;

  AvatarRepositoryImpl(this._mySizeDao, this._myClosetDao);

  @override
  Future<ResponseWrapper<MySizeInfo>> getBodyInfo() async {
    final response = await _mySizeDao.getMySizeInfo();
    return response.toModel<MySizeInfo>(response.data!.toModel());
  }

  @override
  Future<ResponseWrapper<MyClothes>> getClothesInfoById(String id) async {
    final response = await _myClosetDao.getClothesInfoById(id);
    return response.toModel<MyClothes>(response.data!.toModel());
  }
}
