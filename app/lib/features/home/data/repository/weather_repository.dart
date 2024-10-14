import 'dart:convert';
import 'dart:developer';

import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/common/services/cache/controllers_enum.dart';
import 'package:weather_app/common/services/cache/i_cache_manager.dart';
import 'package:weather_app/common/services/client/i_client_service.dart';
import 'package:weather_app/common/utils/formatters.dart';
import 'package:weather_app/features/home/data/models/request/load_params_request_model.dart';
import 'package:weather_app/features/home/data/models/response/weather_model.dart';
import 'package:weather_app/features/home/data/repository/i_weather_repository.dart';

class WeatherRepository implements IWeatherRepository {
  final IClientService client;
  final ICacheManager cacheManager;

  const WeatherRepository({
    required this.client,
    required this.cacheManager,
  });

  @override
  Future<(Weather?, IWeatherException?)> loadCurrentData(
      LoadParamsRequestModel params) async {
    final cache = await _loadCacheResponse();

    if (cache != null) {
      final same = params.coordinates != null &&
          sameCoordinates(
            params.coordinates!,
            (cache.location.lat, cache.location.lon),
          );

      final now = DateTime.now();
      Duration difference = now.difference(cache.location.localtime);
      if (difference.inMinutes > 60 || !same) {
        return _loadRemoteData(params);
      } else {
        return (cache, null);
      }
    }

    return _loadRemoteData(params);
  }

  Future<(Weather?, IWeatherException?)> _loadRemoteData(
      LoadParamsRequestModel params) async {
    const apiKey = String.fromEnvironment('API_KEY');
    const baseUrl = String.fromEnvironment('BASE_URL');

    var query = '?days=7';
    if (params.coordinates != null) {
      query += '&q=${params.coordinates?.$1},${params.coordinates?.$2}';
    } else if (params.cityName != null) {
      query += '&q=${params.cityName}';
    }

    final response = await client.get('$baseUrl$query&key=$apiKey');
    if (response.statusCode != 200) {
      return (null, InternalServerError(message: response.message ?? ''));
    }
    final decoded = Weather.fromJson(response.data);

    await _saveCacheResponse(decoded);
    return (decoded, null);
  }

  Future<Weather?> _loadCacheResponse() async {
    try {
      final json = await cacheManager.get(ControllersEnum.weather);
      if (json != null) {
        return Weather.fromJson(jsonDecode(json));
      }
      return null;
    } catch (e) {
      log('', error: 'Failed to get weather cache: $e');
      return null;
    }
  }

  Future<bool> _saveCacheResponse(Weather weather) async {
    try {
      final json = weather.toJson();
      await cacheManager.save(ControllersEnum.weather, jsonEncode(json));
      return true;
    } catch (e) {
      log('', error: 'Failed to save weather cache: $e');
      return false;
    }
  }
}
