import 'package:coordination_app/core/extenstions.dart';

import '../../../core/utils/error/error_response.dart';
import '../../../presentation/pages/closet/closet_category.dart';
import '../../model/common/result.dart';
import '../../repository/my_closet.repository.dart';
import '../base/local.usecase.dart';

class GetMyClosetUsecase extends LocalUsecase<MyClosetRepository> {
  final ClosetCategory category;
  GetMyClosetUsecase({required this.category});

  @override
  Future call(MyClosetRepository repository) async {
    final result = await repository.getMyCloset();

    if (result.status.isSuccess) {
      final filteredData = result.data!
          .where((clothes) => clothes.category == category)
          .toList();

      return Result.success(filteredData);
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
