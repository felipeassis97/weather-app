import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/routes/route_name.dart';
import 'package:weather_app/common/routes/home_routes.dart';
import 'package:weather_app/common/routes/search_routes.dart';
import 'package:weather_app/common/routes/settings_routes.dart';
import 'package:weather_app/features/initialization/ui/bloc/initialization_cubit.dart';
import 'package:weather_app/features/initialization/ui/pages/onboarding_page.dart';
import 'package:weather_app/common/widgets/nav_bar/scaffold_with_nested_navigation.dart';
import 'package:weather_app/features/initialization/ui/pages/splash_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _searchNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: RouteName.splash,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: RouteName.splash,
      builder: (context, state) => BlocProvider(
        create: (context) => InitializationCubit(),
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: RouteName.onboarding,
      name: RouteName.onboarding,
      builder: (context, state) => BlocProvider(
        create: (context) => InitializationCubit(),
        child: const OnboardingPage(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [homeRoutes],
        ),
        StatefulShellBranch(
          navigatorKey: _searchNavigatorKey,
          routes: [searchRoutes],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [settingsRoutes],
        ),
      ],
    ),
  ],
);
