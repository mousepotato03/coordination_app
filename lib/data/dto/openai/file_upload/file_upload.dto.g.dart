// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileUploadResponseImpl _$$FileUploadResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FileUploadResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      bytes: (json['bytes'] as num).toInt(),
      created_at: (json['created_at'] as num).toInt(),
      filename: json['filename'] as String,
      purpose: json['purpose'] as String,
    );

Map<String, dynamic> _$$FileUploadResponseImplToJson(
        _$FileUploadResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'bytes': instance.bytes,
      'created_at': instance.created_at,
      'filename': instance.filename,
      'purpose': instance.purpose,
    };
