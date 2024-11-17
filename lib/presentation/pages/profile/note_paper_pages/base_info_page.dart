import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/custom_text_field.dart';
import '../riverpod/my_size_info_provider.dart';

class BaseInfoPage extends ConsumerWidget {
  const BaseInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mySize = ref.watch(mySizeInfoProvider).mySizeInfo;
    final isEditMode = ref.watch(mySizeInfoProvider).isEditMode;

    return Column(
      children: [
        CustomTextField(
          label: '이름 :',
          value: mySize.name,
          isEditMode: isEditMode,
        ),
        CustomTextField(
          label: '나이 :',
          value: mySize.age.toString(),
          unit: '세',
          isEditMode: isEditMode,
        ),
        CustomTextField(
          label: '성별 :',
          value: mySize.sex,
          isEditMode: isEditMode,
        ),
        CustomTextField(
          label: '키 :',
          value: mySize.height.toString(),
          unit: 'cm',
          isEditMode: isEditMode,
        ),
        CustomTextField(
          label: '몸무게 :',
          value: mySize.weight.toString(),
          unit: 'kg',
          isEditMode: isEditMode,
        ),
      ],
    );
  }
}
