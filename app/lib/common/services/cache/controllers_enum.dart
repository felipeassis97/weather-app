enum ControllersEnum {
  firstRun('firstRun'),
  language('language'),
  themeMode('themeMode'),
  weather('weather');

  final String key;
  const ControllersEnum(this.key);

  static ControllersEnum fromKey(String key) {
    switch (key) {
      case 'firstRun':
        return ControllersEnum.firstRun;

      case 'language':
        return ControllersEnum.language;

      case 'themeMode':
        return ControllersEnum.themeMode;

      case 'weather':
        return ControllersEnum.weather;
      default:
        throw Exception('Key not found $key');
    }
  }
}
