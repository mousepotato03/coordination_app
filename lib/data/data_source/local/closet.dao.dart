import 'package:hive_flutter/hive_flutter.dart';

import '../../entity/closet/my_closet.entity.dart';
import '../../response_wrapper/response_wrapper.dart';

const String _myClosetDb = "MyClosetDB";

class MyClosetDao {
  Future<ResponseWrapper<List<MyClosetEntity>>> getMyCloset() async {
    final localDB = await Hive.openBox<MyClosetEntity>(_myClosetDb);
    return ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "내 옷장 불러오기 성공",
      data: localDB.values.toList(),
    );
  }

  Future<ResponseWrapper<List<MyClosetEntity>>> addMyClothes(
      MyClosetEntity clothes) async {
    final localDB = await Hive.openBox<MyClosetEntity>(_myClosetDb);
    await localDB.put(clothes.id, clothes);
    return ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "선택한 옷 추가 완료",
      data: localDB.values.toList(),
    );
  }

  Future<ResponseWrapper<List<MyClosetEntity>>> deleteMyClothes(
      String id) async {
    final localDB = await Hive.openBox<MyClosetEntity>(_myClosetDb);
    // 존재하지 않는 옷일 경우 예외처리
    if (!localDB.containsKey(id)) {
      return const ResponseWrapper(
        status: "FAIL",
        code: "4004",
        message: "존재하지 않는 옷입니다",
      );
    }

    await localDB.delete(id);

    return ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "선택한 옷 삭제 완료",
      data: localDB.values.toList(),
    );
  }

  Future<ResponseWrapper<void>> modifyMyClothes(
      MyClosetEntity clothes) async {
    final localDB = await Hive.openBox<MyClosetEntity>(_myClosetDb);
    // 존재하지 않는 옷일 경우 예외처리
    if (!localDB.containsKey(clothes.id)) {
      return const ResponseWrapper(
        status: "FAIL",
        code: "4004",
        message: "존재하지 않는 옷입니다",
      );
    }

    await localDB.put(clothes.id, clothes);

    return const ResponseWrapper(
      status: "SUCCESS",
      code: "0000",
      message: "내 옷장 수정 완료",
    );
  }
}
