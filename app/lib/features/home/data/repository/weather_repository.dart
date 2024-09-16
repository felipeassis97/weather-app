import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/common/services/client/i_client_service.dart';
import 'package:weather_app/features/home/data/models/request/load_params_request_model.dart';
import 'package:weather_app/features/home/data/models/response/weather_model.dart';
import 'package:weather_app/features/home/data/repository/i_weather_repository.dart';

class WeatherRepository implements IWeatherRepository {
  final IClientService client;

  const WeatherRepository({required this.client});

  @override
  Future<(Weather?, IWeatherException?)> loadCurrentData(
      LoadParamsRequestModel params) async {
    const apiKey = String.fromEnvironment('API_KEY');
    const baseUrl = String.fromEnvironment('BASE_URL');

    var query = '?days=7';
    if (params.coordinates != null) {
      query += '&q=${params.coordinates?.$1},${params.coordinates?.$2}';
    }

    final response = await client.get('$baseUrl$query&key=$apiKey');
    if (response.statusCode != 200) {
      return (null, InternalServerError(message: response.message ?? ''));
    }
    final decoded = Weather.fromJson(response.data);
    return (decoded, null);
  }
}
