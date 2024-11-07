import 'package:flutter/material.dart';

import 'presentation/routes/routes.dart';

void main() {
  runApp(const CoordinationApp());
}

class CoordinationApp extends StatelessWidget {
  const CoordinationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
