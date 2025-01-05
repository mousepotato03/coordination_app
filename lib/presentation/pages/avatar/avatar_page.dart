import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class AvatarPage extends ConsumerWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        UnityWidget(
          onUnityCreated: (controller) {
            debugPrint("onUnityCreated");
          },
        ),
      ],
    );
  }
}
