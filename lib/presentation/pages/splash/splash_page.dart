import 'package:coordination_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';
import '../avatar/riverpod/unity_controller_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isUnityLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  void _onUnityLoaded(UnityWidgetController controller, WidgetRef ref) {
    ref.read(unityControllerProvider.notifier).state = controller;
    setState(() {
      _isUnityLoaded = true;
    });
    context.go(RoutePath.main);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0,
            child: Consumer(
              builder: (context, ref, child) => UnityWidget(
                onUnityCreated: (controller) => _onUnityLoaded(controller, ref),
              ),
            ),
          ),
          const ColoredBox(
            color: Color(0xffffb85a),
            child: SizedBox.expand(),
          ),
          Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset("$baseImagePath/logo.png"),
            ),
          ),
        ],
      ),
    );
  }
}
