import 'package:coordination_app/presentation/pages/profile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/my_size_info_provider.dart';

class UpperBodyInfoPage extends ConsumerWidget {
  const UpperBodyInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mySize = ref.watch(mySizeInfoProvider).mySizeInfo;
    final isEditMode = ref.watch(mySizeInfoProvider).isEditMode;

    return Column(
      children: [
        CustomTextField(
          label: "총장 :",
          value: mySize.chestHeight.toString(),
          unit: "cm",
          isEditMode: isEditMode,
        ),
        CustomTextField(
          label: "어깨너비 :",
          value: mySize.shoulderWidth.toString(),
          unit: "cm",
          isEditMode: isEditMode,
        ),
        CustomTextField(
          label: "가슴높이 :",
          value: mySize.chestHeight.toString(),
          unit: "cm",
          isEditMode: isEditMode,
        ),
      ],
    );
  }
}
