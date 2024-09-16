import 'package:weather_app/common/geolocator/geolocator_service.dart';
import 'package:weather_app/common/geolocator/i_geolocation_service.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/common/services/cache/i_cache_manager.dart';
import 'package:weather_app/common/services/cache/shared_preferences_cache.dart';
import 'package:weather_app/common/services/client/dio_client_service.dart';
import 'package:weather_app/common/services/client/i_client_service.dart';

final class ServicesServiceLocator {
  static void init() {
    //Services
    getIt.registerFactory<IClientService>(
      () => DioClientService(),
    );

    getIt.registerFactory<IGeolocatorService>(
      () => GeolocatorService(),
    );

    getIt.registerFactory<ICacheManager>(
      () => SharedPreferencesCache(),
    );
  }
}
