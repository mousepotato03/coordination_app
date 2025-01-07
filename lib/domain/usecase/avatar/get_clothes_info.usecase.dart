import 'package:coordination_app/core/extenstions.dart';
import 'package:coordination_app/core/utils/error/error_response.dart';
import 'package:coordination_app/domain/model/common/result.dart';
import 'package:coordination_app/domain/repository/my_closet.repository.dart';

import '../../../presentation/main/bottom_sheet/closet/closet_category.dart';
import '../../model/my_clothes/my_clothes.model.dart';
import '../base/local.usecase.dart';

class SendClothesInfoUsecase extends LocalUsecase<MyClosetRepository> {
  final MyClothes myClothes;

  SendClothesInfoUsecase({required this.myClothes});

  @override
  Future call(MyClosetRepository repository) async {
    final result = await repository.getMyCloset();

    if (!result.status.isSuccess) {
      return Result.failure(
        ErrorResponse(
          status: result.status,
          code: result.code,
          message: result.message,
        ),
      );
    }

    final Map<String, String> clothingData = {
      '티셔츠': 'keep',
      '바지': 'keep',
      '신발': 'keep',
    };

    switch (myClothes.category) {
      case ClosetCategory.top:
        clothingData['티셔츠'] = myClothes.imagePath;
        break;
      case ClosetCategory.bottom:
        clothingData['바지'] = myClothes.imagePath;
        break;
      case ClosetCategory.shoes:
        clothingData['신발'] = myClothes.imagePath;
        break;
      default:
        break;
    }

    return Result.success(clothingData);
  }
}
