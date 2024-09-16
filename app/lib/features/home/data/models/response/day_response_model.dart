import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/features/home/data/models/response/hour_day_weather_model.dart';

class DayResponseModel {
  final DateTime date;
  final double maxTempC;
  final double maxTempF;
  final double minTempC;
  final double minTempF;
  final double maxWindMph;
  final double chanceOfRain;
  final double chanceOfSnow;
  final double humidity;
  final String sunrise;
  final String sunset;
  final List<HourDayWeatherModel> hour;

  const DayResponseModel({
    required this.date,
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.sunrise,
    required this.sunset,
    required this.maxWindMph,
    required this.chanceOfRain,
    required this.chanceOfSnow,
    required this.humidity,
    required this.hour,
  });

  factory DayResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      return DayResponseModel(
        date: DateTime.parse(json['date']),
        maxTempC: json['day']['maxtemp_c'],
        maxTempF: json['day']['maxtemp_f'],
        minTempC: json['day']['mintemp_c'],
        minTempF: json['day']['mintemp_f'],
        sunrise: json['astro']['sunrise'],
        sunset: json['astro']['sunset'],
        maxWindMph: json['day']['maxwind_mph'].toDouble(),
        chanceOfRain: json['day']['daily_chance_of_rain'].toDouble(),
        chanceOfSnow: json['day']['daily_chance_of_snow'].toDouble(),
        humidity: json['day']['avghumidity'].toDouble(),
        hour: List.from(json['hour'])
            .map((e) => HourDayWeatherModel.fromJson(e))
            .toList(),
      );
    } catch (e) {
      throw DecoderException(message: 'Fail decode DayResponseModel, $e');
    }
  }
}
