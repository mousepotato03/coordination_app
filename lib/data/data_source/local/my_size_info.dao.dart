import 'package:hive_flutter/hive_flutter.dart';

import '../../entity/my_size/my_size_info.entity.dart';

const String _mySizeDb = "MySizeDB";

class MySizeDao {
  Future<MySizeInfoEntity?> getMySizeInfo() async {
    final localDB = await Hive.openBox<MySizeInfoEntity>(_mySizeDb);
    return localDB.isEmpty ? null : localDB.get(0);
  }

  Future<void> saveMySizeInfo(MySizeInfoEntity sizeInfo) async {
    final localDB = await Hive.openBox<MySizeInfoEntity>(_mySizeDb);
    await localDB.put(0, sizeInfo);
  }
}
