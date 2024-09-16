import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/features/home/data/models/response/day_response_model.dart';
import 'package:weather_app/features/home/data/models/response/current_location_model.dart';

import 'current_weather_model.dart';

class Weather {
  final CurrentWeatherModel current;
  final CurrentLocationModel location;
  final List<DayResponseModel> day;

  const Weather({
    required this.location,
    required this.current,
    required this.day,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    try {
      return Weather(
        location: CurrentLocationModel.fromJson(json["location"]),
        current: CurrentWeatherModel.fromJson(json["current"]),
        day: List.from(json['forecast']['forecastday'])
            .map((e) => DayResponseModel.fromJson(e))
            .toList(),
      );
    } catch (e) {
      throw DecoderException(message: 'Fail decode Weather, $e');
    }
  }
}
