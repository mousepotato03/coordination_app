import 'dart:convert';

import 'package:coordination_app/core/extensions.dart';

import '../../../core/utils/error/error_response.dart';
import '../../../presentation/main/bottom_sheet/closet/closet_category.dart';
import '../../model/common/result.dart';
import '../../model/my_clothes/my_clothes.model.dart';
import '../../repository/avatar.repository.dart';
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

    // Unity 코드의 Dictionary<string, Dictionary<string, string>> 구조에 맞춤
    final Map<String, Map<String, String>> clothingData = {
      'tshirts': {'uv': 'keep', 'main_color': ''},
      'pants': {'uv': 'keep', 'main_color': ''},
      'shoes': {'uv': 'keep', 'main_color': ''},
    };

    switch (myClothes.category) {
      case ClosetCategory.top:
        clothingData['tshirts'] = {
          'uv': myClothes.uvMapPath ?? 'null',
          'main_color': myClothes.mainColor ?? '',
        };
        break;
      case ClosetCategory.bottom:
        clothingData['pants'] = {
          'uv': myClothes.uvMapPath ?? 'null',
          'main_color': myClothes.mainColor ?? '',
        };
        break;
      case ClosetCategory.shoes:
        clothingData['shoes'] = {
          'uv': myClothes.uvMapPath ?? 'null',
          'main_color': myClothes.mainColor ?? '',
        };
        break;
      default:
        break;
    }

    return Result.success(jsonEncode(clothingData));
  }
}
