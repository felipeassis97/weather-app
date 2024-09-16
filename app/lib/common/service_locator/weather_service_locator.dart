import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/common/services/client/i_client_service.dart';
import 'package:weather_app/features/home/data/repository/i_weather_repository.dart';
import 'package:weather_app/features/home/data/repository/weather_repository.dart';

final class WeatherServiceLocator {
  static void init() {
    //Repository
    getIt.registerFactory<IWeatherRepository>(
      () => WeatherRepository(
        client: getIt.get<IClientService>(),
      ),
    );
  }
}
