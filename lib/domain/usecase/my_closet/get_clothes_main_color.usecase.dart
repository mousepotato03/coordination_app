import 'package:coordination_app/core/extensions.dart';

import '../../../core/utils/error/error_response.dart';
import '../../../presentation/main/bottom_sheet/closet/closet_category.dart';
import '../../model/common/result.dart';
import '../../repository/my_closet.repository.dart';
import '../base/local.usecase.dart';

class GetClothesMainColorUsecase extends LocalUsecase<MyClosetRepository> {
  final ClosetCategory imageCategory;
  final String imagePath;

  GetClothesMainColorUsecase(
      {required this.imageCategory, required this.imagePath});

  @override
  Future call(MyClosetRepository repository) async {
    final result = await repository.exportMainColor(imageCategory, imagePath);
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
