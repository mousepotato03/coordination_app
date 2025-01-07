import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/my_size_info_provider.dart';
import '../widget/custom_text_field.dart';

class LowerBodyInfoPage extends ConsumerWidget {
  const LowerBodyInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mySize = ref.watch(mySizeInfoProvider).mySizeInfo;
    final isEditMode = ref.watch(mySizeInfoProvider).isEditMode;

    return Column(
      children: [
        CustomTextField(
          label: '총장 :',
          field: 'lowerBodyHeight',
          value: mySize.lowerBodyHeight.toString(),
          unit: 'cm',
          isEditMode: isEditMode,
        ),
        CustomTextField(
          label: '허리단면 :',
          field: 'waistWidth',
          value: mySize.waistWidth.toString(),
          unit: 'cm',
          isEditMode: isEditMode,
        ),
      ],
    );
  }
}
