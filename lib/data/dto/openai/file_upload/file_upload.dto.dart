import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload.dto.freezed.dart';
part 'file_upload.dto.g.dart';

@freezed
class FileUploadResponse with _$FileUploadResponse {
  const factory FileUploadResponse({
    required String id,
    required String object,
    required int bytes,
    required int created_at,
    required String filename,
    required String purpose,
  }) = _FileUploadResponse;

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$FileUploadResponseFromJson(json);
}
