import 'dart:io';

import 'package:coordination_app/core/theme/constant/app_colors.dart';
import 'package:coordination_app/domain/model/my_clothes/my_clothes.model.dart';
import 'package:coordination_app/presentation/pages/avatar/riverpod/avatar_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../error/error_response.dart';

class CommonDialog {
  CommonDialog();

  static Future<bool?> errorDialog(BuildContext context, ErrorResponse error) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: SizedBox(
              height: 70,
              child: Column(
                children: [
                  Text("${error.message}"),
                  Text("${error.code}"),
                ],
              ),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () => context.pop(true),
                child: const Text("다시 시도"),
              ),
              ElevatedButton(
                onPressed: () => exit(0),
                child: const Text("종료"),
              ),
            ],
          );
        });
  }

  static Future<bool?> applyClothesDialog(
    BuildContext context,
    WidgetRef ref,
    MyClothes clothes,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('착용하시겠습니까?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(
                File(clothes.imagePath),
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(true),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () async {
                await ref
                    .read(avatarStateProvider.notifier)
                    .getClothesInfo(clothes);
                if (context.mounted) {
                  context.pop(true);
                }
              },
              child: const Text('입기'),
            ),
          ],
        );
      },
    );
  }

  static Future<bool?> takeOffClothesDialog(
    BuildContext context,
    WidgetRef ref,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "착용된 아이템들을 해제할까요?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(true),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () async {
                ref.read(avatarStateProvider.notifier).clearClothes();
                if (context.mounted) {
                  context.pop(true);
                }
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }

  static Future<void> loadingDialog(
    BuildContext context,
    String title,
    String content,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                content,
                style: const TextStyle(
                  color: AppColors.unimportant,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
