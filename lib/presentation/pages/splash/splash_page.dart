import 'dart:async';

import 'package:coordination_app/core/utils/constants.dart';
import 'package:coordination_app/presentation/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () => context.go(RoutePath.main));
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
