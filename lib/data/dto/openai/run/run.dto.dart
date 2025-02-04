import 'package:freezed_annotation/freezed_annotation.dart';

part 'run.dto.freezed.dart';
part 'run.dto.g.dart';

@freezed
class RunRequest with _$RunRequest {
  const factory RunRequest({
    required String assistant_id,
  }) = _RunRequest;

  factory RunRequest.fromJson(Map<String, dynamic> json) =>
      _$RunRequestFromJson(json);
}

@freezed
class RunResponse with _$RunResponse {
  const factory RunResponse({
    required String id,
  }) = _RunResponse;

  factory RunResponse.fromJson(Map<String, dynamic> json) =>
      _$RunResponseFromJson(json);
}

@freezed
class RunStatusResponse with _$RunStatusResponse {
  const factory RunStatusResponse({
    required String status,
  }) = _RunStatusResponse;

  factory RunStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$RunStatusResponseFromJson(json);
}
