import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/constant/app_icons.dart';

enum BottomNav { closet, avatar, profile }

final bottomNavProvider = StateNotifierProvider<BottomNavController, int>(
    (ref) => BottomNavController());

class BottomNavController extends StateNotifier<int> {
  BottomNavController() : super(BottomNav.values.length ~/ 2);

  void changeIndex(int newIndex) => state = newIndex;
}

// extension BottomNavControllerX on WidgetRef {
//   BottomNavController get readBottomNavController =>
//       read(bottomNavProvider.notifier);
//
//   BottomNavController get watchBottomNavController =>
//       watch(bottomNavProvider.notifier);
// }

extension BottomNavEx on BottomNav {
  String get toName {
    switch (this) {
      case BottomNav.closet:
        return "옷장";
      case BottomNav.avatar:
        return "아바타";
      case BottomNav.profile:
        return "프로필";
    }
  }

  String get icon {
    switch (this) {
      case BottomNav.closet:
        return AppIcons.closet;
      case BottomNav.avatar:
        return AppIcons.avatar;
      case BottomNav.profile:
        return AppIcons.profile;
    }
  }
}
