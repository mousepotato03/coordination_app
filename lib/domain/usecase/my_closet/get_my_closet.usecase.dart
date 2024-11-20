import 'package:coordination_app/core/extenstions.dart';

import '../../../core/utils/error/error_response.dart';
import '../../model/common/result.dart';
import '../../repository/my_closet.repository.dart';
import '../base/local.usecase.dart';

class GetMyClosetUsecase extends LocalUsecase<MyClosetRepository> {
  GetMyClosetUsecase();

  @override
  Future call(MyClosetRepository repository) async {
    final result = await repository.getMyCloset();
    return result.status.isSuccess
        ? Result.success(result.data)
        : Result.failure(
            ErrorResponse(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
}
