import 'package:get_it/get_it.dart';
import 'package:weather_app/common/service_locator/services_service_locator.dart';
import 'package:weather_app/common/service_locator/theme_service_locator.dart';
import 'package:weather_app/common/service_locator/weather_service_locator.dart';

final GetIt getIt = GetIt.instance;

final class MainServiceLocator {
  static void init() {
    ThemeServiceLocator.init();
    ServicesServiceLocator.init();
    WeatherServiceLocator.init();
  }
}
