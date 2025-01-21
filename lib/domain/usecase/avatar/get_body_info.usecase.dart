import 'package:coordination_app/core/extensions.dart';
import 'package:coordination_app/core/utils/error/error_response.dart';
import 'package:coordination_app/domain/model/common/result.dart';
import 'package:coordination_app/domain/repository/avatar.repository.dart';
import 'package:coordination_app/domain/usecase/base/local.usecase.dart';

class GetBodyInfoUsecase extends LocalUsecase<AvatarRepository> {
  GetBodyInfoUsecase();

  @override
  Future call(AvatarRepository repository) async {
    final result = await repository.getBodyInfo();

    if (!result.status.isSuccess) {
      return Result.failure(
        ErrorResponse(
          status: result.status,
          code: result.code,
          message: result.message,
        ),
      );
    }

    final mySizeInfo = result.data;
    final Map<String, dynamic> bodyParameters = {
      'height': mySizeInfo?.height,
      'weight': mySizeInfo?.weight,
      'upperBodyHeight': mySizeInfo?.upperBodyHeight,
      'shoulderWidth': mySizeInfo?.shoulderWidth,
      'armLength': mySizeInfo?.armLength,
      'lowerBodyHeight': mySizeInfo?.lowerBodyHeight,
      'waistWidth': mySizeInfo?.waistWidth,
      'shoesSize': mySizeInfo?.shoesSize,
    };

    return Result.success(bodyParameters);
  }
}
