import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/features/home/data/models/response/current_weather_condition_model.dart';

class HourDayWeatherModel {
  final DateTime time;
  final double tempC;
  final double tempF;
  final bool isDay;
  final CurrentWeatherCondition condition;

  const HourDayWeatherModel(
      {required this.time,
      required this.tempC,
      required this.tempF,
      required this.isDay,
      required this.condition});

  factory HourDayWeatherModel.fromJson(Map<String, dynamic> json) {
    try {
      return HourDayWeatherModel(
        time: DateTime.parse(json['time']),
        tempC: json['temp_c'].toDouble(),
        tempF: json['temp_f'].toDouble(),
        isDay: json['is_day'] == 1,
        condition: CurrentWeatherCondition.fromJson(json['condition']),
      );
    } catch (e) {
      throw DecoderException(message: 'Fail decode HourDayWeatherModel, $e');
    }
  }
}
