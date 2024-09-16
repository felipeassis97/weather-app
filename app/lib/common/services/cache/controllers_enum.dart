enum ControllersEnum {
  firstRun('firstRun');

  final String key;
  const ControllersEnum(this.key);

  static ControllersEnum fromKey(String key) {
    switch (key) {
      case 'firstRun':
        return ControllersEnum.firstRun;
      default:
        throw Exception('Key not found $key');
    }
  }
}
