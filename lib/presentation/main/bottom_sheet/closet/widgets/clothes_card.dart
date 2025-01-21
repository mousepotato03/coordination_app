import 'dart:io';

import 'package:coordination_app/core/theme/constant/app_colors.dart';
import 'package:coordination_app/core/utils/dialog/common_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/model/my_clothes/my_clothes.model.dart';
import '../riverpod/closet_provider.dart';
import '../riverpod/delete_mode_provider.dart';

class ClothesCard extends ConsumerStatefulWidget {
  final MyClothes clothes;

  const ClothesCard({
    super.key,
    required this.clothes,
  });

  @override
  ConsumerState<ClothesCard> createState() => _ClothesCardState();
}

class _ClothesCardState extends ConsumerState<ClothesCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final isDeleteMode = ref.watch(deleteModeProvider);
    final closetNotifier = ref.read(closetProvider.notifier);

    return GestureDetector(
      onTap: () {
        if (!isDeleteMode) {
          CommonDialog.applyClothesDialog(context, ref, widget.clothes);
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Image.file(
              File(widget.clothes.imagePath),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          if (isDeleteMode)
            Positioned(
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    value: isSelected,
                    fillColor: WidgetStateProperty.all(AppColors.negative),
                    onChanged: (bool? value) {
                      setState(() {
                        isSelected = value ?? false;
                      });
                      if (isSelected) {
                        closetNotifier.addToDeleteList(widget.clothes.id);
                      } else {
                        closetNotifier.removeFromDeleteList(widget.clothes.id);
                      }
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
