import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get onboardingStepOneTitleLabel => 'Track Weather Wherever You Are!';

  @override
  String get onboardingStepOneDescriptionLabel => 'Check current conditions and get a detailed 7-day forecast from anywhere in the world.';

  @override
  String get onboardingStepTwoTitleLabel => 'Save Your Favorite Locations!';

  @override
  String get onboardingStepTwoDescriptionLabel => 'Add and save your favorite places to quickly access weather details anytime.';

  @override
  String get onboardingStepThreeTitleLabel => 'Simple and Efficient Search!';

  @override
  String get onboardingStepThreeDescriptionLabel => 'Search by city, ZIP code, or coordinates to find weather details for any place in the world.';

  @override
  String get onboardingNextButton => 'Next';

  @override
  String get onboardingStartButton => 'Start';

  @override
  String get onboardingSkipButton => 'Skip';

  @override
  String get navigationBarWeatherLabel => 'Weather';

  @override
  String get navigationBarSearchLabel => 'Search';

  @override
  String get navigationBarSettingsLabel => 'Settings';

  @override
  String get homeSearchLabel => 'Search for a city';

  @override
  String get homeCurrentWeatherWind => 'Wind';

  @override
  String get homeCurrentWeatherHumidity => 'Humidity';

  @override
  String get homeCurrentWeatherRain => 'Rain';

  @override
  String get homeCurrentWeatherSunset => 'Sunset';

  @override
  String get homeTodayLabel => 'Today';

  @override
  String get settingsAppBarTitle => 'Settings';

  @override
  String get settingsLanguagesTitle => 'Language';

  @override
  String get settingsLanguagesPortuguese => 'Portuguese';

  @override
  String get settingsLanguagesSpanish => 'Spanish';

  @override
  String get settingsLanguagesEnglish => 'English';

  @override
  String get settingsModesTitle => 'Theme mode';

  @override
  String get settingsModeDark => 'Dark';

  @override
  String get settingsModeLight => 'Light';

  @override
  String get loadingLabel => 'Loading...';
}
