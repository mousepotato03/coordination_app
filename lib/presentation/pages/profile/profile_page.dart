import 'package:coordination_app/core/theme/constant/app_colors.dart';
import 'package:coordination_app/core/utils/wigets/width_height.dart';
import 'package:coordination_app/presentation/pages/profile/widget/note_pad_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants.dart';
import 'note_paper_pages/note_paper_pages.dart';
import 'riverpod/my_size_info_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mySizeInfoProvider.notifier).getMySizeInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = ref.watch(mySizeInfoProvider).isEditMode;
    final status = ref.watch(mySizeInfoProvider).status;
    return Scaffold(
        body: Center(
      child: switch (status) {
        Status.initial || Status.loading => const CircularProgressIndicator(),
        Status.success => Column(
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
                  if (isEditMode) {
                    FocusScope.of(context).unfocus();
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref.read(mySizeInfoProvider.notifier).saveMySizeInfo();
                    });
                  }
                  ref.read(mySizeInfoProvider.notifier).toggleEditMode();
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
        Status.error => const Text("에러"),
      },
    ));
  }
}
