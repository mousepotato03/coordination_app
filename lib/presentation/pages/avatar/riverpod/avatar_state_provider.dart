import 'dart:convert';

import 'package:coordination_app/domain/model/my_clothes/my_clothes.model.dart';
import 'package:coordination_app/domain/usecase/avatar/avatar.usecase.dart';
import 'package:coordination_app/domain/usecase/avatar/get_body_info.usecase.dart';
import 'package:coordination_app/domain/usecase/avatar/get_clothes_info.usecase.dart';
import 'package:coordination_app/presentation/pages/avatar/riverpod/avatar_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/exception/common_exception.dart';
import '../../../../core/utils/logger.dart';
import '../../../../dependency_injection.dart';
import '../../../../domain/usecase/my_outfit/evaluating_outfit.usecase.dart';
import '../../../../domain/usecase/my_outfit/my_outfit.usecase.dart';

final avatarStateProvider = StateNotifierProvider<AvatarNotifier, AvatarState>(
    (ref) => getIt<AvatarNotifier>());

@injectable
class AvatarNotifier extends StateNotifier<AvatarState> {
  final AvatarUsecase _avatarUsecase;
  final MyOutfitUsecase _myOutfitUsecase;

  AvatarNotifier(this._avatarUsecase, this._myOutfitUsecase)
      : super(const AvatarState());

  Future<void> getBodyInfo() async {
    try {
      final response =
          await _avatarUsecase.execute(usecase: GetBodyInfoUsecase());
      response.when(
        success: (data) {
          state = state.copyWith(
            status: Status.success,
            bodyInfo: data.toString(),
          );
        },
        failure: (error) => state = state.copyWith(
          status: Status.error,
          error: error,
        ),
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(e),
      );
    }
  }

  Future<void> getClothesInfo(MyClothes myClothes) async {
    try {
      final response = await _avatarUsecase.execute(
          usecase: GetClothesInfoUsecase(myClothes: myClothes));
      response.when(
        success: (data) {
          state = state.copyWith(
            status: Status.success,
            clothesInfo: data.toString(),
            needsRefresh: true,
          );
          //updateCurrentWearing(myClothes);
        },
        failure: (error) => state = state.copyWith(
          status: Status.error,
          error: error,
        ),
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(e),
      );
    }
  }

  void clearClothes() {
    if (state.clothesInfo.isEmpty) {
      state = state.copyWith(status: Status.error);
      return;
    }

    final Map<String, Map<String, String>> clothingData = {
      'tshirts': {'uv': 'delete', 'main_color': ''},
      'pants': {'uv': 'delete', 'main_color': ''},
      'shoes': {'uv': 'delete', 'main_color': ''},
    };
    state = state.copyWith(
      status: Status.success,
      clothesInfo: jsonEncode(clothingData).toString(),
      needsRefresh: true,
    );
  }

  void resetRefreshState() {
    state = state.copyWith(needsRefresh: false);
  }

  Future<void> evaluatingOutfit() async {
    try {
      state = state.copyWith(status: Status.loading);

      final response =
          await _myOutfitUsecase.execute(usecase: EvaluatingOutfit(""));
      response.when(
        success: (data) {
          state = state.copyWith(
            status: Status.success,
          );
        },
        failure: (error) => state = state.copyWith(
          status: Status.error,
          error: error,
        ),
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(e),
      );
    }
  }
}
