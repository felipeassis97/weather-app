import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/routes/route_name.dart';
import 'package:weather_app/features/home/ui/bloc/home_cubit.dart';
import 'package:weather_app/features/home/ui/pages/home_page.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';

final homeRoutes = GoRoute(
  path: RouteName.home,
  name: RouteName.home,
  builder: (context, state) => BlocProvider(
    create: (context) => HomeCubit(),
    child: HomePage(themeControl: getIt.get<ThemeControl>()),
  ),
);
