import 'package:coordination_app/core/theme/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants.dart';
import '../../../core/utils/widgets/width_height.dart';
import '../avatar/riverpod/avatar_state_provider.dart';
import 'note_pad/notepad.dart';
import 'note_paper_pages/note_paper_content.dart';
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
      backgroundColor: AppColors.background,
      body: Center(
        child: switch (status) {
          Status.initial || Status.loading => const CircularProgressIndicator(),
          Status.success => SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const NotePadWidget(
                      papers: [
                        NotePaper(
                          title: "기본 정보",
                          content: BaseInfo(),
                        ),
                        NotePaper(
                          title: "상의 정보",
                          content: UpperBodyInfo(),
                        ),
                        NotePaper(
                          title: "하의 정보",
                          content: LowerBodyInfo(),
                        ),
                        NotePaper(
                          title: "신발 정보",
                          content: ShoesInfo(),
                        ),
                      ],
                    ),
                    height10,
                    const Text(
                      "사이즈코리아의 데이터를 기반으로 작성됐습니다.",
                      style: TextStyle(
                        color: AppColors.unimportant,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    height10,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {
                        if (isEditMode) {
                          FocusScope.of(context).unfocus();
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) async {
                            await ref
                                .read(mySizeInfoProvider.notifier)
                                .saveMySizeInfo();
                            ref
                                .read(avatarStateProvider.notifier)
                                .getBodyInfo();
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
              ),
            ),
          Status.error => const Text("에러"),
        },
      ),
    );
  }
}
