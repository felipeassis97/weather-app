import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/features/home/data/models/response/current_weather_condition_model.dart';

class CurrentWeatherModel {
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final bool isDay;
  final double maxWindMph;
  final double feelsLikeC;
  final double feelsLikeF;
  final double humidity;
  final CurrentWeatherCondition condition;

  const CurrentWeatherModel(
      {required this.lastUpdated,
      required this.tempC,
      required this.tempF,
      required this.isDay,
      required this.condition,
      required this.maxWindMph,
      required this.feelsLikeF,
      required this.feelsLikeC,
      required this.humidity});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    try {
      return CurrentWeatherModel(
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"].toDouble(),
        tempF: json["temp_f"].toDouble(),
        isDay: json["is_day"] == 1,
        maxWindMph: json['wind_mph'].toDouble(),
        feelsLikeC: json['feelslike_c'].toDouble(),
        feelsLikeF: json['feelslike_f'].toDouble(),
        humidity: json['humidity'].toDouble(),
        condition: CurrentWeatherCondition.fromJson(json["condition"]),
      );
    } catch (e) {
      throw DecoderException(message: 'Fail decode Current, $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "last_updated": lastUpdated,
      "temp_c": tempC,
      "temp_f": tempF,
      "is_day": isDay ? 1 : 0,
      "wind_mph": maxWindMph,
      "feelslike_c": feelsLikeC,
      "feelslike_f": feelsLikeF,
      "humidity": humidity,
      "condition": condition.toJson(),
    };
  }
}
