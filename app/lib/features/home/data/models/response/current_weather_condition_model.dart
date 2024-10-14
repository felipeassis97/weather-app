import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/features/home/data/models/response/weather_type_enum.dart';

class CurrentWeatherCondition {
  final WeatherType type;
  final String icon;

  const CurrentWeatherCondition({
    required this.type,
    required this.icon,
  });

  factory CurrentWeatherCondition.fromJson(Map<String, dynamic> json) {
    try {
      return CurrentWeatherCondition(
        type: WeatherType.fromName(json["text"]),
        icon: 'https:${json["icon"]}',
      );
    } catch (e) {
      throw DecoderException(message: 'Fail decode Condition, $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "text": type.name,
      "icon": icon.replaceAll('https:', ''),
    };
  }
}
