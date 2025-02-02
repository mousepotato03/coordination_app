// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_request.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptChatCompletionRequest _$GptChatCompletionRequestFromJson(
        Map<String, dynamic> json) =>
    GptChatCompletionRequest(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      maxTokens: (json['maxTokens'] as num?)?.toInt() ?? 500,
    );

Map<String, dynamic> _$GptChatCompletionRequestToJson(
        GptChatCompletionRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages,
      'maxTokens': instance.maxTokens,
    };

GptMessage _$GptMessageFromJson(Map<String, dynamic> json) => GptMessage(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$GptMessageToJson(GptMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
