import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/geolocator/i_geolocation_service.dart';
import 'package:weather_app/common/services/cache/controllers_enum.dart';
import 'package:weather_app/common/services/cache/i_cache_manager.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/features/initialization/ui/bloc/initialization_state.dart';
import 'package:weather_app/features/settings/data/repository/i_settings_repository.dart';

final class InitializationCubit extends Cubit<InitializationState> {
  InitializationCubit() : super(LoadingInitializationState());

  final _themeControl = getIt.get<ThemeControl>();
  final _geolocation = getIt.get<IGeolocatorService>();
  final _cacheManager = getIt.get<ICacheManager>();
  final _settingsRepository = getIt.get<ISettingsRepository>();

  Future<void> requestPermission() async {
    final permission = await _geolocation.requestPermission();
    print(permission);
  }

  Future<bool> checkIfFirstRun() async {
    final result = await _cacheManager.get(ControllersEnum.firstRun);
    return result == 'true';
  }

  Future<void> setIsNotFirstRun() async {
    await _cacheManager.save(ControllersEnum.firstRun, 'false');
  }

  Future<void> loadUserPreferences() async {
    final lang = await _settingsRepository.getLanguage();
    final theme = await _settingsRepository.getTheme();
    _themeControl.setNewLocale(Locale(lang.code));
    _themeControl.setThemeMode(theme.mode);
  }
}
