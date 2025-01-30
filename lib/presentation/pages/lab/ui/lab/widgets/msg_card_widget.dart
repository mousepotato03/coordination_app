import 'dart:ui';

import 'package:coordination_app/presentation/main/riverpod/user_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageCard extends ConsumerWidget {
  final String imagePath;
  final double width;
  final double height;

  const MessageCard({
    super.key,
    required this.imagePath,
    this.width = 200,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur 효과
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.5), // 반투명 배경
            border: Border.all(color: Colors.white.withOpacity(0.3)), // 테두리
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async =>
                      ref.read(userStateProvider.notifier).sendKakaoMsg(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
