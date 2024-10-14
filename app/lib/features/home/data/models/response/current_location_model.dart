import 'package:weather_app/common/exceptions/i_weather_exception.dart';
import 'package:weather_app/common/utils/extensions/date_time_extension.dart';

class CurrentLocationModel {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final DateTime localtime;

  CurrentLocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory CurrentLocationModel.fromJson(Map<String, dynamic> json) {
    try {
      return CurrentLocationModel(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: DateTime.parse(json["localtime"]).dateFromTz(json["tz_id"]),
      );
    } catch (e) {
      throw DecoderException(message: 'Fail decode Location, $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "region": region,
      "country": country,
      "lat": lat,
      "lon": lon,
      "tz_id": tzId,
      "localtime_epoch": localtimeEpoch,
      "localtime": localtime.toIso8601String(),
    };
  }
}
