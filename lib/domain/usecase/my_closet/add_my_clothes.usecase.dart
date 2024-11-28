import 'package:coordination_app/core/extenstions.dart';

import '../../../core/utils/error/error_response.dart';
import '../../model/common/result.dart';
import '../../model/my_clothes/my_clothes.model.dart';
import '../../repository/my_closet.repository.dart';
import '../base/local.usecase.dart';

class AddMyClothesUsecase extends LocalUsecase<MyClosetRepository> {
  final MyClothes clothes;

  AddMyClothesUsecase(this.clothes);

  @override
  Future call(MyClosetRepository repository) async {
    final result = await repository.addMyClothes(clothes);

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
