import 'package:coordination_app/core/utils/error/error_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.failure(ErrorResponse message) = Error;
}

