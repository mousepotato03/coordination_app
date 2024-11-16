import '../model/my_size/my_size_info.model.dart';
import '../../data/response_wrapper/response_wrapper.dart';
import 'repository.dart';

abstract class MySizeInfoRepository extends Repository {
  Future<ResponseWrapper<MySizeInfo>> getMySizeInfo();

  Future<ResponseWrapper<void>> saveMySizeInfo(MySizeInfo mySizeInfo);
}
