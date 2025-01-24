import 'dart:io';

import 'package:coordination_app/core/extensions.dart';
import 'package:coordination_app/core/utils/dialog/common_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/constant/app_colors.dart';
import 'closet_category.dart';
import 'riverpod/closet_provider.dart';

class ClothesDetailPage extends ConsumerStatefulWidget {
  final String imagePath;

  const ClothesDetailPage({super.key, required this.imagePath});

  @override
  ConsumerState<ClothesDetailPage> createState() => _ClothesDetailPageState();
}

class _ClothesDetailPageState extends ConsumerState<ClothesDetailPage> {
  ClosetCategory selectedCategory = ClosetCategory.top;
  final currentDate = DateTime.now().formattedDate;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<ClosetCategory>(
                    value: selectedCategory,
                    iconSize: 30,
                    items: ClosetCategory.values
                        .map<DropdownMenuItem<ClosetCategory>>(
                            (ClosetCategory value) =>
                                DropdownMenuItem<ClosetCategory>(
                                  value: value,
                                  child: Text(
                                    value.label,
                                  ),
                                ))
                        .toList(),
                    onChanged: (ClosetCategory? value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                  ColoredBox(
                    color: AppColors.unimportant,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        currentDate,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _descriptionController,
                maxLength: 500,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: '옷에 대한 설명을 입력해주세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  counterText: '${_descriptionController.text.length}/500',
                ),
                onChanged: (text) {
                  setState(() {});
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () async {
                  CommonDialog.loadingDialog(
                    context,
                    "이미지 처리 중입니다.",
                    "다소 시간이 소요될 수 있습니다",
                  );

                  await ref.read(closetProvider.notifier).addMyClothes(
                        imagePath: widget.imagePath,
                        category: selectedCategory,
                        createdAt: currentDate,
                        memo: _descriptionController.text,
                      );
                  if (context.mounted) {
                    context.pop(); //dialog
                    context.pop(); //this page
                  }
                },
                child: const SizedBox(
                  width: 100,
                  height: 35,
                  child: Center(child: Text("저장하기")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
