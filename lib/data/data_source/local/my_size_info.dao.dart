import 'package:hive_flutter/hive_flutter.dart';

import '../../entity/my_size/my_size_info.entity.dart';
import '../../response_wrapper/response_wrapper.dart';

const String _mySizeDb = "MySizeDB";

class MySizeDao {
  Future<ResponseWrapper<MySizeInfoEntity>> getMySizeInfo() async {
    final localDB = await Hive.openBox<MySizeInfoEntity>(_mySizeDb);
    return ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "내 사이즈 불러오기 성공",
      data: localDB.get(0) ?? MySizeInfoEntity(),
    );
  }

  Future<ResponseWrapper<void>> saveMySizeInfo(MySizeInfoEntity sizeInfo) async {
    final localDB = await Hive.openBox<MySizeInfoEntity>(_mySizeDb);
    await localDB.put(0, sizeInfo);
    return const ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "내 사이즈 저장 완료",
    );
  }
}
