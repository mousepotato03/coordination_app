import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/utils/error/error_response.dart';
import '../../../core/utils/exception/common_exception.dart';
import '../../../core/utils/logger.dart';
import '../../model/common/result.dart';
import '../../repository/user.repository.dart';
import '../base/local.usecase.dart';

class LoginWithTokenUsecase extends LocalUsecase<UserRepository> {
  @override
  Future<Result<User>> call(UserRepository repository) async {
    // 토큰 유효성 확인 및 갱신
    if (await AuthApi.instance.hasToken()) {
      try {
        await UserApi.instance.accessTokenInfo();
      } catch (error) {
        CustomLogger.logger.e(error.toString());
        throw CommonException.setError(error);
      }
    } else {
      return const Result.failure(
        ErrorResponse(),
      );
    }

    var user = await UserApi.instance.me();

    return Result.success(user);
  }
}
