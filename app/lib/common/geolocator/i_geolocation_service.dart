import 'package:weather_app/common/geolocator/permission_type_enum.dart';

abstract class IGeolocatorService {
  Future<void> openAppSettings();
  Future<void> openLocationSettings();
  Future<bool> isLocationServiceEnabled();
  Future<PermissionTypeEnum> requestPermission();
  Future<(double lat, double lng)> getCurrentPosition();
}
