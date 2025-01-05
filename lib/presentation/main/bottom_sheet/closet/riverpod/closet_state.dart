import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/error/error_response.dart';
import '../../../../../domain/model/my_clothes/my_clothes.model.dart';
import '../closet_category.dart';

part 'closet_state.freezed.dart';

@freezed
class ClosetState with _$ClosetState {
  const factory ClosetState({
    @Default(Status.initial) Status status,
    @Default(<ClosetCategory, List<MyClothes>>{})
    Map<ClosetCategory, List<MyClothes>> clothes,
    @Default(<String>[]) List<String> selectedClothesIds,
    @Default(ErrorResponse()) ErrorResponse error,
  }) = _ClosetState;
}
