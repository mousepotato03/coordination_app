import 'package:coordination_app/core/secure_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

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

  //Kakao login
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);

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
