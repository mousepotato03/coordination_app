import 'package:go_router/go_router.dart';

import '../main/main_screen.dart';
import 'route_path.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.main,
      name: "main",
      builder: (context, state) => const MainScreen(),
    ),
  ],
  initialLocation: RoutePath.main,
);
