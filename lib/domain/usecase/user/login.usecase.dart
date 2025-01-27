import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/utils/error/error_response.dart';
import '../../../core/utils/exception/common_exception.dart';
import '../../../core/utils/logger.dart';
import '../../model/common/result.dart';
import '../../repository/user.repository.dart';
import '../base/remote.usecase.dart';

class LoginUsecase extends RemoteUsecase<UserRepository> {
  @override
  Future<Result<User>> call(UserRepository repository) async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
      } catch (error) {
        if (error is KakaoAuthException &&
            (error.message?.contains('Cancelled') ?? false)) {
          return Result.failure(
            ErrorResponse(
              message: error.message,
            ),
          );
        }

        await _loginWithKakaoAccount();
      }
    } else {
      await _loginWithKakaoAccount();
    }

    var user = await UserApi.instance.me();

    return Result.success(user);
  }
}

Future<void> _loginWithKakaoAccount() async {
  try {
    await UserApi.instance.loginWithKakaoAccount();
  } catch (error) {
    if (error is PlatformException && error.code == 'CANCELED') {
      return;
    }

    CustomLogger.logger.e(error.toString());
    throw CommonException.setError(error);
  }
}
