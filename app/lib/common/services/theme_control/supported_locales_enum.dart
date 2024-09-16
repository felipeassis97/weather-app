import 'package:weather_app/l10n/app_localizations.dart';

enum SupportedLocalesEnum {
  pt('pt'),
  en('en'),
  es('es');

  final String code;
  const SupportedLocalesEnum(this.code);

  @override
  String toString([AppLocalizations? localization]) {
    if (localization == null) {
      return code;
    }
    switch (this) {
      case SupportedLocalesEnum.pt:
        return localization.settingsLanguagesPortuguese;
      case SupportedLocalesEnum.en:
        return localization.settingsLanguagesEnglish;
      case SupportedLocalesEnum.es:
        return localization.settingsLanguagesSpanish;
      default:
        return code;
    }
  }
}
