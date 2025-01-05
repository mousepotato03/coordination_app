import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/constant/app_colors.dart';
import '../../../../../core/utils/constants.dart';

class ClosetBottomSheetAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ClosetBottomSheetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: AppColors.primary,
      child: SvgPicture.asset(
        "$baseIconPath/svg/closet.svg",
        width: 24,
        height: 24,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 30);
}
