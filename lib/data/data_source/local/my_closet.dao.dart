import 'package:hive_flutter/hive_flutter.dart';

import '../../entity/my_clothes/my_clothes.entity.dart';
import '../../response_wrapper/response_wrapper.dart';

const String _myClosetDb = "MyClosetDB";

class MyClosetDao {
  Future<ResponseWrapper<List<MyClothesEntity>>> getMyCloset() async {
    final localDB = await Hive.openBox<MyClothesEntity>(_myClosetDb);
    return ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "내 옷장 불러오기 성공",
      data: localDB.values.toList(),
    );
  }

  Future<ResponseWrapper<List<MyClothesEntity>>> addMyClothes(
      MyClothesEntity clothes) async {
    final localDB = await Hive.openBox<MyClothesEntity>(_myClosetDb);
    await localDB.put(clothes.id, clothes);
    return ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "선택한 옷 추가 완료",
      data: localDB.values.toList(),
    );
  }

  Future<ResponseWrapper<List<MyClothesEntity>>> deleteMyClothes(
      List<String> ids) async {
    final localDB = await Hive.openBox<MyClothesEntity>(_myClosetDb);

    await localDB.deleteAll(ids);

    return ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "선택한 옷 삭제 완료",
      data: localDB.values.toList(),
    );
  }

  Future<ResponseWrapper<List<MyClothesEntity>>> modifyMyClothes(
      String id, MyClothesEntity clothes) async {
    final localDB = await Hive.openBox<MyClothesEntity>(_myClosetDb);
    // 존재하지 않는 옷일 경우 예외처리
    if (!localDB.containsKey(id)) {
      return const ResponseWrapper(
        status: "FAIL",
        code: "4004",
        message: "존재하지 않는 옷입니다",
      );
    }

    await localDB.put(id, clothes);

    return ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "내 옷장 수정 완료",
      data: localDB.values.toList(),
    );
  }
}
