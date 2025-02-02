// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptChatCompletionResponse _$GptChatCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    GptChatCompletionResponse(
      choices: (json['choices'] as List<dynamic>)
          .map((e) => GptChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GptChatCompletionResponseToJson(
        GptChatCompletionResponse instance) =>
    <String, dynamic>{
      'choices': instance.choices,
    };

GptChoice _$GptChoiceFromJson(Map<String, dynamic> json) => GptChoice(
      message: GptMessage.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GptChoiceToJson(GptChoice instance) => <String, dynamic>{
      'message': instance.message,
    };
