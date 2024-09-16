import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';

final class ThemeServiceLocator {
  static void init() {
    getIt.registerLazySingleton(() => ThemeControl());
  }
}
