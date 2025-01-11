import 'dart:convert';

import 'package:coordination_app/core/extenstions.dart';
import 'package:coordination_app/core/utils/error/error_response.dart';
import 'package:coordination_app/domain/model/common/result.dart';
import 'package:coordination_app/domain/repository/avatar.repository.dart';

import '../../../presentation/main/bottom_sheet/closet/closet_category.dart';
import '../../model/my_clothes/my_clothes.model.dart';
import '../base/local.usecase.dart';

class GetClothesInfoUsecase extends LocalUsecase<AvatarRepository> {
  final MyClothes myClothes;

  GetClothesInfoUsecase({required this.myClothes});

  @override
  Future call(AvatarRepository repository) async {
    final result = await repository.getClothesInfoById(myClothes.id);

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
      'tshirts': 'keep',
      'pants': 'keep',
      'shoes': 'keep',
    };

    switch (myClothes.category) {
      case ClosetCategory.top:
        clothingData['tshirts'] = myClothes.imagePath;
        break;
      case ClosetCategory.bottom:
        clothingData['pants'] = myClothes.imagePath;
        break;
      case ClosetCategory.shoes:
        clothingData['shoes'] = myClothes.imagePath;
        break;
      default:
        break;
    }

    return Result.success(jsonEncode(clothingData));
  }
}
