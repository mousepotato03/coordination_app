import 'package:coordination_app/core/extensions.dart';

import '../../../core/utils/error/error_response.dart';
import '../../model/common/result.dart';
import '../../repository/my_closet.repository.dart';
import '../base/local.usecase.dart';

class DeleteMyClothesUsecase extends LocalUsecase<MyClosetRepository> {
  final List<String> ids;

  DeleteMyClothesUsecase(this.ids);

  @override
  Future call(MyClosetRepository repository) async {
    final result = await repository.deleteMyClothes(ids);
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
