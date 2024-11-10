import 'package:coordination_app/presentation/pages/avatar/avatar_page.dart';
import 'package:coordination_app/presentation/pages/closet/closet.dart';
import 'package:coordination_app/presentation/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'riverpod/bottom_nav_controller.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNav = ref.watch(bottomNavProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("디자이너가 없네"),
      ),
      body: _getPage(currentNav),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentNav,
        onTap: (newIndex) =>
            ref.read(bottomNavProvider.notifier).changeIndex(newIndex),
        items: List.generate(
          BottomNav.values.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(BottomNav.values[index].icon,
                width: 24, height: 24),
            label: BottomNav.values[index].toName,
          ),
        ),
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (BottomNav.values[index]) {
      case BottomNav.closet:
        return const ClosetPage();
      case BottomNav.profile:
        return const ProfilePage();
      case BottomNav.avatar:
      default:
        return const AvatarPage();
    }
  }
}
