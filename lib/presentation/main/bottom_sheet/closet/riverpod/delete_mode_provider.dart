import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteModeProvider =
    StateNotifierProvider<DeleteModeNotifier, bool>((ref) {
  return DeleteModeNotifier();
});

class DeleteModeNotifier extends StateNotifier<bool> {
  DeleteModeNotifier() : super(false);

  void toggleDeleteMode() {
    state = !state;
  }
}
