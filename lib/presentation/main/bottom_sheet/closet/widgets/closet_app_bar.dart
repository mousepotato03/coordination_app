import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/constant/app_colors.dart';
import '../../../../../core/utils/constants.dart';

class ClosetBottomSheetAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ClosetBottomSheetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          color: AppColors.primary,
          child: SvgPicture.asset(
            "$baseIconPath/svg/closet.svg",
            width: 24,
            height: 24,
          ),
        ),
        Positioned(
          top: 5,
          child: Container(
            height: 8,
            width: 30,
            decoration: BoxDecoration(
              color: const Color(0x735c5c5c),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 30);
}
