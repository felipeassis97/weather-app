import 'package:go_router/go_router.dart';
import 'package:weather_app/common/routes/route_name.dart';
import 'package:weather_app/features/settings/ui/pages/settings_page.dart';

final settingsRoutes = GoRoute(
  path: RouteName.settings,
  name: RouteName.settings,
  builder: (context, state) => const SettingsPage(),
);
