import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ];

  /// No description provided for @onboardingStepOneTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Track Weather Wherever You Are!'**
  String get onboardingStepOneTitleLabel;

  /// No description provided for @onboardingStepOneDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Check current conditions and get a detailed 7-day forecast from anywhere in the world.'**
  String get onboardingStepOneDescriptionLabel;

  /// No description provided for @onboardingStepTwoTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Save Your Favorite Locations!'**
  String get onboardingStepTwoTitleLabel;

  /// No description provided for @onboardingStepTwoDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Add and save your favorite places to quickly access weather details anytime.'**
  String get onboardingStepTwoDescriptionLabel;

  /// No description provided for @onboardingStepThreeTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Simple and Efficient Search!'**
  String get onboardingStepThreeTitleLabel;

  /// No description provided for @onboardingStepThreeDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Search by city, ZIP code, or coordinates to find weather details for any place in the world.'**
  String get onboardingStepThreeDescriptionLabel;

  /// No description provided for @onboardingNextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNextButton;

  /// No description provided for @onboardingStartButton.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get onboardingStartButton;

  /// No description provided for @onboardingSkipButton.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkipButton;

  /// No description provided for @homeSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Search for a city'**
  String get homeSearchLabel;

  /// No description provided for @homeCurrentWeatherWind.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get homeCurrentWeatherWind;

  /// No description provided for @homeCurrentWeatherHumidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get homeCurrentWeatherHumidity;

  /// No description provided for @homeCurrentWeatherRain.
  ///
  /// In en, this message translates to:
  /// **'Rain'**
  String get homeCurrentWeatherRain;

  /// No description provided for @homeCurrentWeatherSunset.
  ///
  /// In en, this message translates to:
  /// **'Sunset'**
  String get homeCurrentWeatherSunset;

  /// No description provided for @homeTodayLabel.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get homeTodayLabel;

  /// No description provided for @settingsAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsAppBarTitle;

  /// No description provided for @settingsLanguagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguagesTitle;

  /// No description provided for @settingsLanguagesPortuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get settingsLanguagesPortuguese;

  /// No description provided for @settingsLanguagesSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get settingsLanguagesSpanish;

  /// No description provided for @settingsLanguagesEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguagesEnglish;

  /// No description provided for @settingsModesTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get settingsModesTitle;

  /// No description provided for @settingsModeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsModeDark;

  /// No description provided for @settingsModeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsModeLight;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
