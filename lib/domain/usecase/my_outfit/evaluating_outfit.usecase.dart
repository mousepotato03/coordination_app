import 'dart:io';

import 'package:coordination_app/core/extensions.dart';
import 'package:coordination_app/core/utils/dev_func/custom_debug_print.dart';
import 'package:coordination_app/domain/repository/my_outfit.repository.dart';
import 'package:coordination_app/domain/usecase/base/remote.usecase.dart';

import '../../../core/utils/error/error_response.dart';
import '../../model/common/result.dart';

class EvaluatingOutfitUsecase extends RemoteUsecase<MyOutfitRepository> {
  final List<String> clothes;

  EvaluatingOutfitUsecase(this.clothes);

  @override
  Future call(MyOutfitRepository repository) async {
    final imageFiles = clothes.map((imagePath) => File(imagePath)).toList();

    final imageUploadRes = await Future.wait(
      imageFiles.map((file) => repository.uploadFile(file)),
    );

    infoDebugPrint(imageUploadRes.toString());

    final evaluatingRes = await repository.evaluatingOutfit(imageUploadRes);

    return evaluatingRes.status.isSuccess
        ? Result.success(evaluatingRes.data)
        : Result.failure(
            ErrorResponse(
              status: evaluatingRes.status,
              code: evaluatingRes.code,
              message: evaluatingRes.message,
            ),
          );
  }
}
