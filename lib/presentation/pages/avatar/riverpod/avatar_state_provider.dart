import 'package:coordination_app/domain/model/my_clothes/my_clothes.model.dart';
import 'package:coordination_app/domain/usecase/avatar/avatar.usecase.dart';
import 'package:coordination_app/domain/usecase/avatar/get_body_info.usecase.dart';
import 'package:coordination_app/presentation/pages/avatar/riverpod/avatar_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/exception/common_exception.dart';
import '../../../../core/utils/logger.dart';
import '../../../../dependency_injection.dart';

final avatarStateProvider = StateNotifierProvider<AvatarNotifier, AvatarState>(
    (ref) => getIt<AvatarNotifier>());

@injectable
class AvatarNotifier extends StateNotifier<AvatarState> {
  final AvatarUsecase _avatarUsecase;

  AvatarNotifier(this._avatarUsecase) : super(const AvatarState());

  Future<void> getBodyInfo() async {
    try {
      final response =
          await _avatarUsecase.execute(usecase: GetBodyInfoUsecase());
      response.when(
        success: (data) {
          state = state.copyWith(
            status: Status.success,
            jsonData: data.toString(),
          );
        },
        failure: (error) => state = state.copyWith(
          status: Status.error,
          error: error,
        ),
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(e),
      );
    }
  }

  Future<void> sendClothesInfo(MyClothes myClothes) async {}
}
