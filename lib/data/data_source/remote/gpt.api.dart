import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../dto/gpt_request.dto.dart';
import '../../dto/gpt_response.dto.dart';

part 'gpt.api.g.dart';

@RestApi(baseUrl: "https://api.openai.com")
abstract class GptApi {
  factory GptApi(Dio dio) = _GptApi;

  @POST("/v1/chat/completions")
  Future<GptChatCompletionResponse> evaluateOutfit(
    @Header("Authorization") String apiKey,
    @Body() GptChatCompletionRequest request,
  );
}
