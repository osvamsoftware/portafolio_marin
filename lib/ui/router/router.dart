import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_marin/ui/home/web/web_home_screen.dart';

class GoRouterConfig {
  static GoRouter goRouter = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: WebHomeScreen.path,
    routes: [
      GoRoute(
        path: WebHomeScreen.path,
        builder: (context, state) => WebHomeScreen(),
      )
    ],
  );
}
