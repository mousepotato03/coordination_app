import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/entity/my_clothes/my_clothes.entity.dart';
import 'data/entity/my_size/my_size_info.entity.dart';
import 'dependency_injection.dart';
import 'presentation/routes/routes.dart';

void main() async {
  //Hive
  await Hive.initFlutter();
  Hive.registerAdapter(MySizeInfoEntityAdapter());
  Hive.registerAdapter(MyClothesEntityAdapter());

  //의존성 주입
  configureDependencies();

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
