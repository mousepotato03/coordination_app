import 'package:coordination_app/core/secure_key.dart';
import 'package:coordination_app/data/response_wrapper/response_wrapper.dart';
import 'package:coordination_app/domain/repository/my_outfit.repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/logger.dart';
import '../data_source/remote/gpt.api.dart';
import '../dto/gpt_request.dto.dart';

@Singleton(as: MyOutfitRepository)
class MyOutfitRepositoryImpl implements MyOutfitRepository {
  final GptApi api;

  MyOutfitRepositoryImpl(this.api);

  @override
  Future<ResponseWrapper<String?>> evaluatingOutfits(
      List<String> imageUrls) async {
    final request = GptChatCompletionRequest(
      model: "gpt-4o",
      messages: [
        {"role": "system", "content": "You are a fashion consultant AI."},
        {
          "role": "user",
          "content": "Here are three outfit images: $imageUrls. "
              "Please analyze whether these outfits are suitable for current weather and suggest improvements."
        }
      ],
    );

    try {
      final response = await api.evaluateOutfit("Bearer $gptKey", request);
      final evaluationRes = response.choices.first.message.content;

      return ResponseWrapper(
        status: "SUCCESS",
        data: evaluationRes,
      );
    } catch (e) {
      CustomLogger.logger.e("ChatGpt 응답 실패: $e");
      return ResponseWrapper(status: "ERROR", data: e.toString());
    }
  }
}
