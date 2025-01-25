import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/constant/app_icons.dart';

enum BottomNav { profile, avatar, lab }

final bottomNavProvider = StateNotifierProvider<BottomNavController, int>(
    (ref) => BottomNavController());

class BottomNavController extends StateNotifier<int> {
  BottomNavController() : super(BottomNav.values.length ~/ 2);

  void changeIndex(int newIndex) => state = newIndex;
}

extension BottomNavEx on BottomNav {
  String get toName {
    switch (this) {
      case BottomNav.lab:
        return "실험실";
      case BottomNav.avatar:
        return "아바타";
      case BottomNav.profile:
        return "프로필";
    }
  }

  String get icon {
    switch (this) {
      case BottomNav.lab:
        return AppIcons.lab;
      case BottomNav.avatar:
        return AppIcons.avatar;
      case BottomNav.profile:
        return AppIcons.profile;
    }
  }
}
