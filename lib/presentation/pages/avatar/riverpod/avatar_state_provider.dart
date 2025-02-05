import 'dart:convert';

import 'package:coordination_app/domain/model/my_clothes/my_clothes.model.dart';
import 'package:coordination_app/domain/usecase/avatar/avatar.usecase.dart';
import 'package:coordination_app/domain/usecase/avatar/get_body_info.usecase.dart';
import 'package:coordination_app/domain/usecase/avatar/get_clothes_info.usecase.dart';
import 'package:coordination_app/domain/usecase/my_outfit/evaluating_outfit.usecase.dart';
import 'package:coordination_app/presentation/pages/avatar/riverpod/avatar_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/exception/common_exception.dart';
import '../../../../core/utils/logger.dart';
import '../../../../dependency_injection.dart';
import '../../../../domain/usecase/my_outfit/my_outfit.usecase.dart';
import '../../../main/bottom_sheet/closet/closet_category.dart';

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
          updateCurrentWearing(myClothes);
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
      currentWearing: {},
    );
  }

  void resetRefreshState() {
    state = state.copyWith(needsRefresh: false);
  }

  void updateCurrentWearing(MyClothes myClothes) {
    final category = myClothes.category;
    final updatedWearing =
        Map<ClosetCategory, MyClothes>.from(state.currentWearing);
    updatedWearing[category] = myClothes;

    state = state.copyWith(currentWearing: updatedWearing);
  }

  Future<void> evaluatingOutfit() async {
    try {
      //이미지 3개 이하면 의상 한 세트가 아니니까 종료함
      if (state.currentWearing.length < 3) {
        state = state.copyWith(status: Status.error);
        return;
      }

      state = state.copyWith(status: Status.loading, isScanning: true);

      final List<String> images = state.currentWearing.entries
          .map((entry) => entry.value.imagePath)
          .toList();

      final response = await _myOutfitUsecase.execute(
          usecase: EvaluatingOutfitUsecase(images));

      response.when(
        success: (data) {
          state = state.copyWith(
            status: Status.success,
            evaluation: data,
            isScanning: false,
          );
        },
        failure: (error) => state = state.copyWith(
          status: Status.error,
          isScanning: false,
          error: error,
        ),
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        isScanning: false,
        error: CommonException.setError(e),
      );
    }
  }

  void resetScanningState() {
    state = state.copyWith(isScanning: false);
  }
}
