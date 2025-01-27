import 'package:coordination_app/core/theme/constant/app_colors.dart';
import 'package:coordination_app/presentation/pages/avatar/avatar_page.dart';
import 'package:coordination_app/presentation/pages/lab/lab_page.dart';
import 'package:coordination_app/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

import 'bottom_sheet/closet/closet_bottom_sheet.dart';
import 'riverpod/bottom_nav_controller.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNav = ref.watch(bottomNavProvider);

    return Scaffold(
      extendBody: true,
      body: currentNav == BottomNav.values.indexOf(BottomNav.avatar)
          ? SlidingUpPanel(
              maxHeight: 700,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              body: const AvatarPage(),
              panelBuilder: () =>
                  currentNav == BottomNav.values.indexOf(BottomNav.avatar)
                      ? const ClosetBottomSheet()
                      : null,
            )
          : _buildPage(currentNav),
      bottomNavigationBar: _buildBottomNavigation(currentNav, ref),
    );
  }

  Widget _buildBottomNavigation(int currentNav, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
      ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            currentIndex: currentNav,
            onTap: (newIndex) =>
                ref.read(bottomNavProvider.notifier).changeIndex(newIndex),
            items: List.generate(
              BottomNav.values.length,
              (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(BottomNav.values[index].icon,
                    width: 24, height: 24),
                activeIcon: SvgPicture.asset(
                  BottomNav.values[index].icon,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                label: BottomNav.values[index].toName,
              ),
            ),
            showUnselectedLabels: false,
            showSelectedLabels: true,
            fixedColor: AppColors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (BottomNav.values[index]) {
      case BottomNav.lab:
        return const LabPage();
      //return const LabPage();
      case BottomNav.profile:
        return const ProfilePage();
      case BottomNav.avatar:
      default:
        return const AvatarPage();
    }
  }
}
