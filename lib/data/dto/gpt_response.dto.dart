import 'package:json_annotation/json_annotation.dart';

import 'gpt_request.dto.dart';

part 'gpt_response.dto.g.dart';

@JsonSerializable()
class GptChatCompletionResponse {
  final List<GptChoice> choices;

  GptChatCompletionResponse({required this.choices});

  factory GptChatCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$GptChatCompletionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GptChatCompletionResponseToJson(this);
}

@JsonSerializable()
class GptChoice {
  final GptMessage message;

  GptChoice({required this.message});

  factory GptChoice.fromJson(Map<String, dynamic> json) =>
      _$GptChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$GptChoiceToJson(this);
}
