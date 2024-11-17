import 'package:coordination_app/presentation/pages/profile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/my_size_info_provider.dart';

class ShoesInfoPage extends ConsumerWidget {
  const ShoesInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mySize = ref.watch(mySizeInfoProvider).mySizeInfo;
    final isEditMode = ref.watch(mySizeInfoProvider).isEditMode;

    return Column(
      children: [
        CustomTextField(
          label: '신발 사이즈 :',
          value: mySize.shoesSize.toString(),
          unit: "mm",
          isEditMode: isEditMode,
        ),
      ],
    );
  }
}
