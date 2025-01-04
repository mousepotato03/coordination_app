import 'package:coordination_app/presentation/pages/avatar/riverpod/unity_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class AvatarPage extends ConsumerWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unityController = ref.watch(unityControllerProvider);

    return Stack(
      children: [
        UnityWidget(
          onUnityCreated: (controller) {},
        ),
      ],
    );
    ;
  }
}
