
import 'dart:async';

import 'package:coordination_app/core/utils/constants.dart';
import 'package:coordination_app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart' hide LinearGradient;

import '../../routes/route_path.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), ()=> context.go(RoutePath.main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffffb85a),
                  Color(0xff5a5c5d),
                  Color(0xff9b6429),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const Center(
            child:
                RiveAnimation.asset("$baseImagePath/splash/splash.riv"),
          ),
        ],
      ),
    );
  }
}
