import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/exception/common_exception.dart';
import '../../../../core/utils/logger.dart';
import '../../../../dependency_injection.dart';
import '../../../../domain/model/my_clothes/my_clothes.model.dart';
import '../../../../domain/usecase/my_closet/add_my_clothes.usecase.dart';
import '../../../../domain/usecase/my_closet/delete_my_clothes.usecase.dart';
import '../../../../domain/usecase/my_closet/get_my_closet.usecase.dart';
import '../../../../domain/usecase/my_closet/modify_my_clothes.usecase.dart';
import '../../../../domain/usecase/my_closet/my_closet.usecase.dart';
import '../closet_category.dart';
import 'closet_state.dart';

final closetProvider = StateNotifierProvider<ClosetNotifier, ClosetState>(
    (ref) => getIt<ClosetNotifier>());

@injectable
class ClosetNotifier extends StateNotifier<ClosetState> {
  final MyClosetUsecase _myClosetUsecase;

  ClosetNotifier(this._myClosetUsecase) : super(const ClosetState());

  Future<void> getMyClothes() async {
    state = state.copyWith(status: Status.loading);
    try {
      final response = await _myClosetUsecase.execute(
        usecase: GetMyClosetUsecase(),
      );
      response.when(
        success: (data) {
          state = state.copyWith(status: Status.success, clothes: data);
        },
        failure: (error) {
          state = state.copyWith(status: Status.error, error: error);
        },
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(e),
      );
    }
  }

  Future<void> addMyClothes({
    required String imagePath,
    required ClosetCategory category,
    required String createdAt,
    String memo = '',
  }) async {
    state = state.copyWith(status: Status.loading);

    final newClothes = MyClothes(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      imagePath: imagePath,
      category: category,
      createdAt: createdAt,
      memo: memo,
    );

    try {
      final response = await _myClosetUsecase.execute(
        usecase: AddMyClothesUsecase(newClothes),
      );
      response.when(
        success: (data) {
          state = state.copyWith(status: Status.success);
          getMyClothes();
        },
        failure: (error) {
          state = state.copyWith(status: Status.error, error: error);
        },
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(e),
      );
    }
  }

  Future<void> deleteMyClothes() async {
    state = state.copyWith(status: Status.loading);
    try {
      final response = await _myClosetUsecase.execute(
        usecase: DeleteMyClothesUsecase([...state.selectedClothesIds]),
      );

      response.when(
        success: (data) {
          state = state.copyWith(
            status: Status.success,
            selectedClothesIds: [],
          );
          getMyClothes();
        },
        failure: (error) {
          state = state.copyWith(
            status: Status.error,
            error: error,
            selectedClothesIds: [],
          );
        },
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      state = state.copyWith(
        status: Status.error,
        error: CommonException.setError(e),
      );
    }
  }

  void addToDeleteList(String id) {
    if (state.selectedClothesIds.contains(id)) return;

    state = state.copyWith(
      selectedClothesIds: [...state.selectedClothesIds, id],
    );
  }

  void removeFromDeleteList(String id) {
    if (!state.selectedClothesIds.contains(id)) return;

    state = state.copyWith(
      selectedClothesIds:
          state.selectedClothesIds.where((item) => item != id).toList(),
    );
  }

  Future<void> modifyMyClothes(MyClothes clothes) async {
    state = state.copyWith(status: Status.loading);
    try {
      final response = await _myClosetUsecase.execute(
        usecase: ModifyMyClothesUsecase(clothes.id, clothes),
      );
      response.when(
        success: (data) {
          state = state.copyWith(status: Status.success);
        },
        failure: (error) {
          state = state.copyWith(status: Status.error, error: error);
        },
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
