import 'package:coordination_app/core/theme/constant/app_colors.dart';
import 'package:coordination_app/core/utils/constants.dart';
import 'package:coordination_app/presentation/pages/avatar/widgets/evaluation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/avatar_state_provider.dart';

class EvaluatingBtn extends ConsumerStatefulWidget {
  const EvaluatingBtn({super.key});

  @override
  ConsumerState createState() => _AvatarFabState();
}

class _AvatarFabState extends ConsumerState<EvaluatingBtn> {
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
      child: Stack(
        children: [
          Positioned(
            right: 2,
            top: 2,
            child: Image.asset(
              "$baseImagePath/ai.png",
              width: 20,
              height: 20,
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(17.0),
            onPressed: () async {
              await ref.read(avatarStateProvider.notifier).evaluatingOutfit();
              if (context.mounted) {
                showEvaluationDialog(context, ref);
              }
            },
            icon: Image.asset(
              "$baseImagePath/evaluation.png",
              width: 30,
              height: 30,
            ),
            iconSize: 80,
          ),
        ],
      ),
    );
  }
}
