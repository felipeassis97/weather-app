import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/features/home/data/models/response/weather_model.dart';
import 'package:weather_app/features/home/data/models/request/load_params_request_model.dart';

abstract interface class IWeatherRepository {
  Future<(Weather?, IWeatherException?)> loadCurrentData(
      LoadParamsRequestModel params);
}
