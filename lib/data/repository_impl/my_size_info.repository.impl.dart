import 'package:coordination_app/data/mapper/common.mapper.dart';
import 'package:coordination_app/data/mapper/my_size_info.mapper.dart';
import 'package:coordination_app/domain/model/my_size/my_size_info.model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/my_size_info.repository.dart';
import '../data_source/local/my_size_info.dao.dart';
import '../response_wrapper/response_wrapper.dart';

@Singleton(as: MySizeInfoRepository)
class MySizeInfoRepositoryImpl implements MySizeInfoRepository {
  final MySizeDao _mySizeDao;

  MySizeInfoRepositoryImpl(this._mySizeDao);

  @override
  Future<ResponseWrapper<MySizeInfo>> getMySizeInfo() async {
    final response = await _mySizeDao.getMySizeInfo();
    return response.toModel<MySizeInfo>(response.data!.toModel());
  }

  @override
  Future<ResponseWrapper<void>> saveMySizeInfo(MySizeInfo mySizeInfo) async {
    final response = await _mySizeDao.saveMySizeInfo(mySizeInfo.toEntity());
    return response.toModel(null);
  }
}
