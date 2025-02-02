import 'package:coordination_app/core/extensions.dart';

import '../../../core/utils/error/error_response.dart';
import '../../model/common/result.dart';
import '../../repository/my_outfit.repository.dart';
import '../base/remote.usecase.dart';

class EvaluatingOutfit extends RemoteUsecase<MyOutfitRepository> {
  final String imageUrls;

  EvaluatingOutfit(this.imageUrls);

  @override
  Future call(MyOutfitRepository repository) async {
    ///ChatGPT API에 이미지를 업로드 할 때, multipart form data를 사용하여
    ///바이너리 데이터를 넘겨주려고 하면 제한이 있어서 불가능 하다고 함.
    ///todo: ChatGPT API 사용을 외부 서버로 분리하고, 서버로 이미지를 보내면 url로 만들어서 처리하는게 좋을듯.
    final nonNullImageUrls = [
      "https://i.ibb.co/tpFvhk4d/Kakao-Talk-20250201-173017846.jpg",
      "https://i.ibb.co/LwsjfnM/Kakao-Talk-20250201-175505093.jpg",
      "https://i.ibb.co/FkLz6dvG/Kakao-Talk-20250201-173722626.jpg",
    ];

    final result = await repository.evaluatingOutfits(nonNullImageUrls);

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
