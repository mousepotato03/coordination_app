// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RunRequestImpl _$$RunRequestImplFromJson(Map<String, dynamic> json) =>
    _$RunRequestImpl(
      assistant_id: json['assistant_id'] as String,
    );

Map<String, dynamic> _$$RunRequestImplToJson(_$RunRequestImpl instance) =>
    <String, dynamic>{
      'assistant_id': instance.assistant_id,
    };

_$RunResponseImpl _$$RunResponseImplFromJson(Map<String, dynamic> json) =>
    _$RunResponseImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$RunResponseImplToJson(_$RunResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$RunStatusResponseImpl _$$RunStatusResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RunStatusResponseImpl(
      status: json['status'] as String,
    );

Map<String, dynamic> _$$RunStatusResponseImplToJson(
        _$RunStatusResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
