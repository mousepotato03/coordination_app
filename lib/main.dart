import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/routes/routes.dart';

void main() {
  runApp(const CoordinationApp());
}

class CoordinationApp extends StatelessWidget {
  const CoordinationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
