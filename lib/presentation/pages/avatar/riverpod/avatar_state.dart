import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/error/error_response.dart';

part 'avatar_state.freezed.dart';

@freezed
class AvatarState with _$AvatarState {
  const factory AvatarState({
    @Default(Status.initial) Status status,
    @Default("") String bodyInfo,
    @Default("") String clothesInfo,
    @Default(false) bool needsRefresh,
    @Default(ErrorResponse()) ErrorResponse error,
  }) = _AvatarState;
}
