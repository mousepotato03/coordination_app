import 'package:coordination_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 60;

  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRect(
          child: Align(
            widthFactor: 0.7,
            heightFactor: 0.3,
            child: SvgPicture.asset(
              "$baseImagePath/logo.svg",
              height: 300,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
