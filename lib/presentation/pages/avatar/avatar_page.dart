import 'package:coordination_app/core/extenstions.dart';
import 'package:coordination_app/presentation/pages/avatar/riverpod/avatar_state_provider.dart';
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
          onUnityCreated: (avatarController) async {
            await ref.read(avatarStateProvider.notifier).getBodyInfo();
            ;
            avatarController
                .sendBodyInfo(ref.read(avatarStateProvider).jsonData);
          },
        ),
      ],
    );
  }
}
