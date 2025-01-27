import 'dart:async';

import 'package:coordination_app/core/utils/constants.dart';
import 'package:coordination_app/presentation/main/riverpod/user_state_provider.dart';
import 'package:coordination_app/presentation/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () => context.go(RoutePath.main));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userStateProvider.notifier).logInWithToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
