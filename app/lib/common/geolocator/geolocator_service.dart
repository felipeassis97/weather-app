import 'package:geolocator/geolocator.dart';
import 'package:weather_app/common/geolocator/i_geolocation_service.dart';
import 'package:weather_app/common/geolocator/permission_type_enum.dart';

class GeolocatorService implements IGeolocatorService {
  @override
  Future<(double, double)?> getCurrentPosition() async {
    final isLocationEnabled = await isLocationServiceEnabled();
    final permission = await requestPermission();

    final canGetLocation = isLocationEnabled &&
        (permission == PermissionTypeEnum.always ||
            permission == PermissionTypeEnum.whileInUse);

    if (canGetLocation) {
      final position = await Geolocator.getCurrentPosition();
      return (position.latitude, position.longitude);
    }
    return null;
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<PermissionTypeEnum> requestPermission() async {
    final LocationPermission permission = await Geolocator.checkPermission();
    final PermissionTypeEnum current =
        PermissionTypeEnum.fromGeolocator(permission);

    if (current == PermissionTypeEnum.always ||
        current == PermissionTypeEnum.whileInUse) {
      return current;
    } else {
      LocationPermission newRequest = await Geolocator.requestPermission();
      return PermissionTypeEnum.fromGeolocator(newRequest);
    }
  }

  @override
  Future<void> openAppSettings() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Future<void> openLocationSettings() async {
    await Geolocator.openAppSettings();
  }
}
