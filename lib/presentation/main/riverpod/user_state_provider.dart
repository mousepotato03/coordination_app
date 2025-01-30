import 'package:coordination_app/domain/usecase/user/send_kakao_msg.usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/constants.dart';
import '../../../core/utils/error/error_response.dart';
import '../../../core/utils/exception/common_exception.dart';
import '../../../core/utils/logger.dart';
import '../../../dependency_injection.dart';
import '../../../domain/model/common/result.dart';
import '../../../domain/usecase/user/login.usecase.dart';
import '../../../domain/usecase/user/login_with_token.usecase.dart';
import '../../../domain/usecase/user/logout.usecase.dart';
import '../../../domain/usecase/user/user.usecase.dart';
import 'user_state.dart';

final userStateProvider = StateNotifierProvider<UserNotifier, UserState>(
    (ref) => getIt<UserNotifier>());

@injectable
class UserNotifier extends StateNotifier<UserState> {
  final UserUsecase _userUsecase;

  UserNotifier(this._userUsecase) : super(UserState());

  Future<void> logIn() async {
    try {
      state = state.copyWith(status: Status.loading);

      final response = await _userUsecase.execute<Result<User>>(
        usecase: LoginUsecase(),
      );

      response.when(
        success: (user) {
          state = state.copyWith(status: Status.success, user: user);
        },
        failure: (_) {
          state = state.copyWith(status: Status.initial);
        },
      );
    } on ErrorResponse catch (error) {
      state = state.copyWith(
        status: Status.error,
        error: error,
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      );
    }
  }

  Future<void> logInWithToken() async {
    state = state.copyWith(status: Status.loading);
    try {
      final response = await _userUsecase.execute<Result<User>>(
        usecase: LoginWithTokenUsecase(),
      );

      response.when(
        success: (user) {
          state = state.copyWith(status: Status.success, user: user);
        },
        failure: (_) {
          state = state.copyWith(status: Status.initial);
        },
      );
    } on ErrorResponse catch (error) {
      state = state.copyWith(
        status: Status.error,
        error: error,
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      );
    }
  }

  Future<void> logOut() async {
    state = state.copyWith(status: Status.loading);
    try {
      await _userUsecase.execute(usecase: LogoutUsecase());
      state = state.copyWith(status: Status.initial, user: null);
    } on ErrorResponse catch (error) {
      state = state.copyWith(
        status: Status.error,
        error: error,
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      );
    }
  }

  Future<void> sendKakaoMsg() async {
    state = state.copyWith(status: Status.loading);
    try {
      await _userUsecase.execute(usecase: SendKakaoMsgUsecase());
    } on ErrorResponse catch (error) {
      state = state.copyWith(
        status: Status.error,
        error: error,
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(error),
      );
    }
  }
}
