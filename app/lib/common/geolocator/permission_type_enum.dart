import 'package:geolocator/geolocator.dart';

enum PermissionTypeEnum {
  denied,
  deniedForever,
  always,
  whileInUse;

  static PermissionTypeEnum fromGeolocator(LocationPermission geolocator) {
    switch (geolocator) {
      case LocationPermission.always:
        return PermissionTypeEnum.always;
      case LocationPermission.whileInUse:
        return PermissionTypeEnum.whileInUse;
      case LocationPermission.denied:
        return PermissionTypeEnum.denied;
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
        return PermissionTypeEnum.deniedForever;
    }
  }
}
