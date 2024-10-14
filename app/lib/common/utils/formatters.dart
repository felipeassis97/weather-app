String cityfromTzName() {
  Map<String, String> _defaultCityByTz = {
    'UTC': 'London',
    'PST': 'Los Angeles',
    'EST': 'New York',
    'CET': 'Paris',
    'IST': 'New Delhi',
    'GMT': 'London',
    'JST': 'Tokyo',
    'BRT': 'São Paulo',
    'AEST': 'Sydney',
    'AKST': 'Anchorage',
    'MSK': 'Moscow',
    'CST': 'Chicago',
    'MST': 'Denver',
    'HKT': 'Hong Kong',
    'NZST': 'Wellington',
    'SAST': 'Johannesburg',
    'PHT': 'Manila',
    'KST': 'Seoul',
    'SGT': 'Singapore',
    'ART': 'Buenos Aires',
  };

  final now = DateTime.now();
  return _defaultCityByTz[now.timeZoneName] ?? 'Sydney';
}

bool sameCoordinates(
    (double lat, double lng) coord1, (double lat, double lng) coord2) {
  String latStr1 = coord1.$1.toString().trim().substring(0, 5);
  String lngStr1 = coord1.$2.toString().trim().substring(0, 5);

  String latStr2 = coord2.$1.toString().trim().substring(0, 5);
  String lngStr2 = coord2.$2.toString().trim().substring(0, 5);

  return latStr1 == latStr2 && lngStr1 == lngStr2;
}
