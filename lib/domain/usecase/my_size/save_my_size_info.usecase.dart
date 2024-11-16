import 'package:coordination_app/core/extenstions.dart';
import 'package:coordination_app/core/utils/error/error_response.dart';
import 'package:coordination_app/domain/model/common/result.dart';
import 'package:coordination_app/domain/model/my_size/my_size_info.model.dart';

import '../../repository/my_size_info.repository.dart';
import '../base/local.usecase.dart';

class SaveMySizeInfoUsecase extends LocalUsecase<MySizeInfoRepository> {
  final MySizeInfo mySizeInfo;

  SaveMySizeInfoUsecase(this.mySizeInfo);

  @override
  Future<Result<void>> call(MySizeInfoRepository repository) async {
    final result = await repository.saveMySizeInfo(mySizeInfo);
    return result.status.isSuccess
        ? const Result.success(null)
        : Result.failure(
            ErrorResponse(
              status: result.status,
              code: result.code,
              message: result.message,
            ),
          );
  }
} 