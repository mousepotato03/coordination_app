import 'package:coordination_app/core/extensions.dart';
import 'package:coordination_app/domain/model/my_clothes/my_clothes.model.dart';

import '../../../core/utils/error/error_response.dart';
import '../../../presentation/main/bottom_sheet/closet/closet_category.dart';
import '../../model/common/result.dart';
import '../../repository/my_closet.repository.dart';
import '../base/local.usecase.dart';

class GetMyClosetUsecase extends LocalUsecase<MyClosetRepository> {
  GetMyClosetUsecase();

  @override
  Future call(MyClosetRepository repository) async {
    final result = await repository.getMyCloset();

    if (result.status.isSuccess) {
      final groupedData =
          result.data!.fold<Map<ClosetCategory, List<MyClothes>>>(
        {},
        (map, clothes) {
          map
              .putIfAbsent(
                clothes.category,
                () => [],
              )
              .add(clothes);
          return map;
        },
      );
      return Result.success(groupedData);
    }

    return Result.failure(
      ErrorResponse(
        status: result.status,
        code: result.code,
        message: result.message,
      ),
    );
  }
}
