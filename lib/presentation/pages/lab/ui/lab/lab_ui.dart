import 'package:coordination_app/core/theme/constant/app_colors.dart';
import 'package:coordination_app/core/utils/constants.dart';
import 'package:coordination_app/presentation/pages/lab/ui/lab/widgets/msg_card_widget.dart';
import 'package:coordination_app/presentation/pages/lab/ui/lab/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/widgets/width_height.dart';

class LabUI extends ConsumerWidget {
  const LabUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileWidget(),
            height20,
            _buildMenuTile(
              context,
              title: "친구에게 공유하기",
              iconPath: "$baseImagePath/kakao_talk.png",
              children: [
                const MessageCard(
                  imagePath: "$baseImagePath/pepe1.png",
                  width: 600,
                  height: 400,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTile(
    BuildContext context, {
    required String title,
    required String iconPath,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // 테두리 추가
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // 여백
      child: ExpansionTile(
        leading: Image.asset(iconPath, width: 40, height: 40),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        children: children,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      ),
    );
  }
}
