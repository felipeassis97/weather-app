import 'package:weather_app/common/services/cache/controllers_enum.dart';

abstract interface class ICacheManager {
  Future<String> get(ControllersEnum key);
  Future<void> delete(ControllersEnum key);
  Future<bool> isExistsKey(ControllersEnum key);
  Future<void> save(ControllersEnum key, String value);
}
