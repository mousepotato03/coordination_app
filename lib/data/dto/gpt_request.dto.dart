import 'package:json_annotation/json_annotation.dart';

part 'gpt_request.dto.g.dart';

@JsonSerializable()
class GptChatCompletionRequest {
  final String model;
  final List<Map<String, dynamic>> messages;
  final int maxTokens;

  GptChatCompletionRequest({
    required this.model,
    required this.messages,
    this.maxTokens = 500,
  });

  factory GptChatCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$GptChatCompletionRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GptChatCompletionRequestToJson(this);
}

@JsonSerializable()
class GptMessage {
  final String role;
  final String content;

  GptMessage({
    required this.role,
    required this.content,
  });

  factory GptMessage.fromJson(Map<String, dynamic> json) =>
      _$GptMessageFromJson(json);
  Map<String, dynamic> toJson() => _$GptMessageToJson(this);
}
