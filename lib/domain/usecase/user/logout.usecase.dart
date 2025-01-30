import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/utils/exception/common_exception.dart';
import '../../../core/utils/logger.dart';
import '../../repository/user.repository.dart';
import '../base/local.usecase.dart';

class LogoutUsecase extends LocalUsecase<UserRepository> {
  @override
  Future<void> call(UserRepository repository) async {
    try {
      await UserApi.instance.logout();
    } catch (e) {
      CustomLogger.logger.e(e.toString());
      throw CommonException.setError(e);
    }
  }
}
