// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageRequestImpl _$$MessageRequestImplFromJson(Map<String, dynamic> json) =>
    _$MessageRequestImpl(
      role: json['role'] as String,
      content: json['content'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$MessageRequestImplToJson(
        _$MessageRequestImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'attachments': instance.attachments,
    };

_$MessageResponseImpl _$$MessageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageResponseImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$MessageResponseImplToJson(
        _$MessageResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
