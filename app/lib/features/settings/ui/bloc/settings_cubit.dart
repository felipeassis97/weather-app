import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/services/theme_control/supported_locales_enum.dart';
import 'package:weather_app/common/services/theme_control/supported_themes_enum.dart';
import 'package:weather_app/features/settings/data/repository/i_settings_repository.dart';
import 'package:weather_app/features/settings/ui/bloc/settings_state.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';

final class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(IdleSettingsState());

  final _themeControl = getIt.get<ThemeControl>();
  final _settingsRepository = getIt.get<ISettingsRepository>();

  Future<void> savePreferenceLanguage(SupportedLocalesEnum locale) async {
    emit(LoadingSettingsState());
    final (_, error) = await _settingsRepository.saveLanguage(locale: locale);

    if (error != null) {
      emit(ErrorSettingsState(error.message));
      return;
    }
    _themeControl.setNewLocale(Locale(locale.code));
    emit(SuccessSettingsState());
  }

  Future<void> savePreferenceTheme(SupportedThemesEnum theme) async {
    emit(LoadingSettingsState());
    final (_, error) = await _settingsRepository.saveTheme(theme: theme);

    if (error != null) {
      emit(ErrorSettingsState(error.message));
      return;
    }
    _themeControl.setThemeMode(theme.mode);
    emit(SuccessSettingsState());
  }
}
