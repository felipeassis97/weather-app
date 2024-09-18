import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/common/services/cache/controllers_enum.dart';
import 'package:weather_app/common/services/cache/i_cache_manager.dart';

class SharedPreferencesCache implements ICacheManager {
  @override
  Future<void> delete(ControllersEnum key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove(key.key);
    } catch (e) {
      throw CacheException(message: 'Failed to delete $key');
    }
  }

  @override
  Future<String> get(ControllersEnum key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (prefs.containsKey(key.key)) {
        return prefs.get(key.key).toString();
      }
      throw CacheException(message: 'Failed to find $key');
    } catch (e) {
      throw CacheException(message: 'Failed to find $key');
    }
  }

  @override
  Future<bool> isExistsKey(ControllersEnum key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key.key);
  }

  @override
  Future<void> save(ControllersEnum key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(key.key, value);
    } catch (e) {
      throw CacheException(message: 'Failed to save data on $key');
    }
  }
}
