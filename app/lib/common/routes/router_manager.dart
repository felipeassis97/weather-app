import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/common/routes/route_name.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/features/home/ui/bloc/home_cubit.dart';
import 'package:weather_app/features/home/ui/pages/home_page.dart';
import 'package:weather_app/features/onboarding/ui/bloc/onboarding_cubit.dart';
import 'package:weather_app/features/onboarding/ui/pages/onboarding_page.dart';
import 'package:weather_app/features/settings/ui/pages/settings_page.dart';

final class RouteManager {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RouteName.onboarding,
        builder: (context, state) => BlocProvider(
          create: (context) => OnboardingCubit(),
          child: const OnboardingPage(),
        ),
      ),
      GoRoute(
          path: RouteName.home,
          name: RouteName.home,
          builder: (context, state) => BlocProvider(
                create: (context) => HomeCubit(),
                child: HomePage(themeControl: getIt.get<ThemeControl>()),
              ),
          routes: [
            GoRoute(
              path: RouteName.settings,
              name: RouteName.settings,
              builder: (context, state) => const SettingsPage(),
            )
          ])
    ],
  );
}
