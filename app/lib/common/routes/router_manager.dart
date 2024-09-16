import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/routes/route_name.dart';
import 'package:weather_app/common/routes/home_routes.dart';
import 'package:weather_app/common/routes/search_routes.dart';
import 'package:weather_app/common/routes/settings_routes.dart';
import 'package:weather_app/features/onboarding/ui/bloc/onboarding_cubit.dart';
import 'package:weather_app/features/onboarding/ui/pages/onboarding_page.dart';
import 'package:weather_app/common/widgets/nav_bar/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _searchNavigatorKey = GlobalKey<NavigatorState>();
final _settingsNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: RouteName.onboarding,
      builder: (context, state) => BlocProvider(
        create: (context) => OnboardingCubit(),
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
