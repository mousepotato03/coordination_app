import 'package:coordination_app/core/theme/constant/app_colors.dart';
import 'package:coordination_app/core/utils/constants.dart';
import 'package:coordination_app/core/utils/dialog/common_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClothesXbtn extends ConsumerStatefulWidget {
  const ClothesXbtn({super.key});

  @override
  ConsumerState createState() => _AvatarFabState();
}

class _AvatarFabState extends ConsumerState<ClothesXbtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            offset: Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            offset: const Offset(-2, -2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: IconButton(
        padding: const EdgeInsets.all(17.0),
        onPressed: () {
          CommonDialog.takeOffClothesDialog(context, ref);
        },
        icon: Image.asset(
          "$baseIconPath/png/trash.png",
          width: 30,
          height: 30,
        ),
        iconSize: 80,
      ),
    );
  }
}
