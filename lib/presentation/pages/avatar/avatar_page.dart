import 'package:coordination_app/core/extensions.dart';
import 'package:coordination_app/presentation/pages/avatar/riverpod/avatar_state_provider.dart';
import 'package:coordination_app/presentation/pages/avatar/widgets/evaluating_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:scanning_effect/scanning_effect.dart';

import 'widgets/clothes_x_btn.dart';

class AvatarPage extends ConsumerStatefulWidget {
  const AvatarPage({super.key});

  @override
  ConsumerState createState() => _AvatarPageState();
}

class _AvatarPageState extends ConsumerState<AvatarPage> {
  UnityWidgetController? avatarController;

  @override
  Widget build(BuildContext context) {
    _addAvatarRefreshListener();

    final isScanning = ref.watch(avatarStateProvider).isScanning;

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        UnityWidget(
          onUnityCreated: _onUnityCreated,
          printSetupLog: false,
          runImmediately: true,
        ),
        if (isScanning)
          const ScanningEffect(
            enableBorder: false,
            scanningHeightOffset: 0.2,
            delay: Duration(milliseconds: 300),
            scanningLinePadding: EdgeInsets.zero,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        const Positioned(
          right: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EvaluatingBtn(),
              SizedBox(height: 10),
              ClothesXbtn(),
            ],
          ),
        )
      ],
    );
  }

  void _onUnityCreated(UnityWidgetController controller) async {
    controller.resume();
    avatarController = controller;

    await ref.read(avatarStateProvider.notifier).getBodyInfo();

    avatarController
        ?.sendBodyInfoToUnity(ref.read(avatarStateProvider).bodyInfo);
  }

  /// AvatarState의 Refresh 필요 여부를 관찰하고, 그에 따라 Unity로 정보를 전달함.
  void _addAvatarRefreshListener() {
    ref.listen(avatarStateProvider, (prev, next) {
      if (prev?.needsRefresh != next.needsRefresh) {
        avatarController
            ?.sendClothesToUnity(ref.read(avatarStateProvider).clothesInfo);
        ref.read(avatarStateProvider.notifier).resetRefreshState();
      }
    });
  }
}
