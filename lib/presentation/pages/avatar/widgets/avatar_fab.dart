import 'package:coordination_app/core/utils/constants.dart';
import 'package:coordination_app/core/utils/dialog/common_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvatarFab extends ConsumerStatefulWidget {
  const AvatarFab({super.key});

  @override
  ConsumerState createState() => _AvatarFabState();
}

class _AvatarFabState extends ConsumerState<AvatarFab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
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
        onPressed: () {
          CommonDialog.takeOffClothesDialog(context, ref);
        },
        icon: Image.asset(
          "$baseIconPath/png/trash.png",
          scale: 12,
        ),
        iconSize: 36,
        splashRadius: 30,
      ),
    );
  }
}
