import 'package:coordination_app/core/extenstions.dart';
import 'package:coordination_app/core/utils/error/error_response.dart';
import 'package:coordination_app/domain/model/common/result.dart';

import '../../repository/my_size_info.repository.dart';
import '../base/local.usecase.dart';

class GetMySizeInfoUsecase extends LocalUsecase<MySizeInfoRepository> {
  GetMySizeInfoUsecase();

  @override
  Future call(MySizeInfoRepository repository) async {
    final result = await repository.getMySizeInfo();
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
