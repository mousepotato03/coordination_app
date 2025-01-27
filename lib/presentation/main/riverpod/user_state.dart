import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/constants.dart';
import '../../../core/utils/error/error_response.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    @Default(Status.initial) Status status,
    @Default(ErrorResponse()) ErrorResponse error,
    User? user,
  }) = _UserState;
}
