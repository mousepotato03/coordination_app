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

  MySizeInfoNotifier(this._mySizeInfoUsecase) : super(MySizeInfoState());

  Future<void> getMySizeInfo() async {
    state = state.copyWith(status: Status.loading);
    try {
      final response =
          await _mySizeInfoUsecase.excute(usecase: GetMySizeInfoUsecase());
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

  Future<void> saveMySizeInfo(MySizeInfo mySizeInfo) async {
    state = state.copyWith(status: Status.loading);
    try {
      final response = await _mySizeInfoUsecase.excute(
        usecase: SaveMySizeInfoUsecase(mySizeInfo),
      );
      response.when(
        success: (_) {
          state = state.copyWith(
            status: Status.success,
            mySizeInfo: mySizeInfo,
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
}
