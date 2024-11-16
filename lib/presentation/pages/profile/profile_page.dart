import 'package:coordination_app/core/theme/constant/app_colors.dart';
import 'package:coordination_app/core/utils/wigets/width_height.dart';
import 'package:coordination_app/presentation/pages/profile/widget/note_pad_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/profile_pages.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
          const NotePadWidget(
            children: [
              BaseInfoPage(),
              UpperBodyInfoPage(),
              LowerBodyInfoPage(),
              ShoesInfoPage(),
            ],
          ),
          height30,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            onPressed: () {
              setState(() {
                isEditMode = !isEditMode;
              });
            },
            child: SizedBox(
              width: 100,
              height: 35,
              child: Icon(
                isEditMode ? Icons.check : Icons.edit,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
            ],
          ),
        ));
  }
}
