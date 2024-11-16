import 'package:coordination_app/domain/model/my_size/my_size_info.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/error/error_response.dart';

part 'my_size_info_state.freezed.dart';

@freezed
class MySizeInfoState with _$MySizeInfoState {
  factory MySizeInfoState({
    @Default(Status.initial) Status status,
    @Default(MySizeInfo()) MySizeInfo mySizeInfo,
    @Default(ErrorResponse()) ErrorResponse error,
  }) = _MySizeInfoState;
}
