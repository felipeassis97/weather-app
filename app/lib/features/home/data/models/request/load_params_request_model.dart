final class LoadParamsRequestModel {
  final (double lat, double lng)? coordinates;
  final String? cityName;
  const LoadParamsRequestModel({
    this.coordinates,
    this.cityName,
  });
}
