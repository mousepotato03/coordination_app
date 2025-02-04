import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread.dto.freezed.dart';
part 'thread.dto.g.dart';

@freezed
class ThreadResponse with _$ThreadResponse {
  const factory ThreadResponse({
    required String id,
  }) = _ThreadResponse;

  factory ThreadResponse.fromJson(Map<String, dynamic> json) =>
      _$ThreadResponseFromJson(json);
}
