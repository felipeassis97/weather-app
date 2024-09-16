enum WeatherType {
  sunny("sunny"),
  mist("mist"),
  overcast("overcast"),
  clear("clear"),
  partlyCloudy("partly cloudy"),
  cloudy("cloudy"),
  fog("fog"),
  lightRain("moderate or heavy rain in area with thunder"),
  moderateRain("light rain"),
  lightRainShower("light rain shower"),
  lightDrizzle("light drizzle"),
  patchyRainNearby("patchy rain nearby"),
  patchyLightRain("patchy light rain"),
  thundery("thundery outbreaks in nearby"),
  patchyLightDrizzle("patchy light drizzle");

  final String name;
  const WeatherType(this.name);

  static WeatherType fromName(String name) {
    return WeatherType.values.firstWhere(
      (weatherType) => weatherType.name == name.toLowerCase().trim(),
      orElse: () =>
          throw ArgumentError('No weather type with name $name found'),
    );
  }
}
