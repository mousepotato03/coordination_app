import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/theme/constant/app_colors.dart';
import '../riverpod/closet_provider.dart';
import '../riverpod/delete_mode_provider.dart';

class ClosetFAB extends ConsumerStatefulWidget {
  const ClosetFAB({super.key});

  @override
  ConsumerState<ClosetFAB> createState() => _CustomFABState();
}

class _CustomFABState extends ConsumerState<ClosetFAB> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: !isExpanded,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color:
                isExpanded ? Colors.black.withOpacity(0.6) : Colors.transparent,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 15,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                isExpanded
                    ? _buildExpandedColumn(context)
                    : _buildDeleteButton(ref),
                const SizedBox(height: 8),
                _buildAddButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () => setState(() => isExpanded = !isExpanded),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.black, width: 1.5),
        ),
        child: AnimatedRotation(
          turns: isExpanded ? 0.125 : 0,
          duration: const Duration(milliseconds: 150),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(WidgetRef ref) {
    final isDeleteMode = ref.watch(deleteModeProvider);

    return GestureDetector(
      onTap: () {
        ref.read(deleteModeProvider.notifier).toggleDeleteMode();

        if (isDeleteMode) ref.read(closetProvider.notifier).deleteMyClothes();
      },
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: AppColors.negative,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.black, width: 1.5),
        ),
        child: !isDeleteMode
            ? const Icon(Icons.delete_forever)
            : const Icon(Icons.check),
      ),
    );
  }

  Widget _buildExpandedColumn(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.black, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () async {
              final file =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (file != null && context.mounted) {
                context.push('/clothes-detail', extra: file.path);
              }
              setState(() => isExpanded = false);
            },
            child: const Row(
              children: [
                Icon(Icons.photo_library, size: 24),
                SizedBox(width: 8),
                Text('갤러리'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: AppColors.black,
            height: 1,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () async {
              final file =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              if (file != null && context.mounted) {
                context.push('/clothes-detail', extra: file.path);
              }
              setState(() => isExpanded = false);
            },
            child: const Row(
              children: [
                Icon(Icons.camera_alt, size: 24),
                SizedBox(width: 8),
                Text('카메라'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
