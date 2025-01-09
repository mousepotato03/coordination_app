import 'package:coordination_app/core/extenstions.dart';
import 'package:coordination_app/core/utils/dev_func/custom_debug_print.dart';
import 'package:coordination_app/presentation/pages/avatar/riverpod/avatar_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class AvatarPage extends ConsumerStatefulWidget {
  const AvatarPage({super.key});

  @override
  ConsumerState createState() => _AvatarPageState();
}

class _AvatarPageState extends ConsumerState<AvatarPage> {
  UnityWidgetController? avatarController;

  @override
  Widget build(BuildContext context) {
    ref.listen(avatarStateProvider, (prev, next) {
      infoDebugPrint(prev.toString());
      if (prev?.needsRefresh != next.needsRefresh) {
        infoDebugPrint(avatarController.toString());
        avatarController
            ?.sendClothesToUnity(ref.read(avatarStateProvider).clothesInfo);
        ref.read(avatarStateProvider.notifier).resetRefreshState();
      }
    });

    return Stack(
      children: [
        UnityWidget(
          onUnityCreated: (controller) async {
            controller.resume();
            avatarController = controller;

            await ref.read(avatarStateProvider.notifier).getBodyInfo();

            avatarController
                ?.sendBodyInfoToUnity(ref.read(avatarStateProvider).bodyInfo);
          },
        ),
      ],
    );
  }
}
