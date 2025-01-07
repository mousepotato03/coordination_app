import 'package:coordination_app/domain/model/my_size/my_size_info.model.dart';
import 'package:coordination_app/domain/usecase/my_size/get_my_size_info.usecase.dart';
import 'package:coordination_app/domain/usecase/my_size/my_size_info.usecase.dart';
import 'package:coordination_app/domain/usecase/my_size/save_my_size_info.usecase.dart';
import 'package:coordination_app/presentation/pages/profile/riverpod/my_size_info_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/exception/common_exception.dart';
import '../../../../core/utils/logger.dart';
import '../../../../dependency_injection.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);

final mySizeInfoProvider =
    StateNotifierProvider<MySizeInfoNotifier, MySizeInfoState>(
        (ref) => getIt<MySizeInfoNotifier>());

@injectable
class MySizeInfoNotifier extends StateNotifier<MySizeInfoState> {
  final MySizeInfoUsecase _mySizeInfoUsecase;

  MySizeInfoNotifier(this._mySizeInfoUsecase) : super(const MySizeInfoState());

  Future<void> getMySizeInfo() async {
    state = state.copyWith(status: Status.loading);
    try {
      final response =
          await _mySizeInfoUsecase.execute(usecase: GetMySizeInfoUsecase());
      response.when(success: (data) {
        state = state.copyWith(status: Status.success, mySizeInfo: data);
      }, failure: (error) {
        state = state.copyWith(status: Status.error, error: error);
      });
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(e),
      );
    }
  }

  Future<void> saveMySizeInfo() async {
    state = state.copyWith(status: Status.loading);
    try {
      final response = await _mySizeInfoUsecase.execute(
        usecase: SaveMySizeInfoUsecase(state.mySizeInfo),
      );
      response.when(
        success: (_) {
          state = state.copyWith(
            status: Status.success,
            mySizeInfo: state.mySizeInfo,
          );
        },
        failure: (error) {
          state = state.copyWith(status: Status.error, error: error);
        },
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(e),
      );
    }
  }

  void toggleEditMode() {
    state = state.copyWith(isEditMode: !state.isEditMode);
  }

  void updateField(String field, String value) {
    final MySizeInfo updatedInfo = switch (field) {
      // 기본 정보
      'name' => state.mySizeInfo.copyWith(name: value),
      'age' => state.mySizeInfo.copyWith(age: int.parse(value)),
      'sex' => state.mySizeInfo.copyWith(sex: value),
      'height' => state.mySizeInfo.copyWith(height: double.parse(value)),
      'weight' => state.mySizeInfo.copyWith(weight: double.parse(value)),

      // 상의
      'upperBodyHeight' =>
        state.mySizeInfo.copyWith(upperBodyHeight: double.parse(value)),
      'shoulderWidth' =>
        state.mySizeInfo.copyWith(shoulderWidth: double.parse(value)),
      'armLength' => state.mySizeInfo.copyWith(armLength: double.parse(value)),

      // 하의
      'lowerBodyHeight' =>
        state.mySizeInfo.copyWith(lowerBodyHeight: double.parse(value)),
      'waistWidth' =>
        state.mySizeInfo.copyWith(waistWidth: double.parse(value)),

      // 신발
      'shoesSize' => state.mySizeInfo.copyWith(shoesSize: int.parse(value)),
      _ => state.mySizeInfo // 매칭되는 필드가 없을 경우 기존 상태 유지
    };

    state = state.copyWith(mySizeInfo: updatedInfo);
  }
}
