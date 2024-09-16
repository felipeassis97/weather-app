import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/geolocator/i_geolocation_service.dart';
import 'package:weather_app/common/services/cache/controllers_enum.dart';
import 'package:weather_app/common/services/cache/i_cache_manager.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/features/onboarding/ui/bloc/onboarding_state.dart';

final class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(LoadingOnboardingState());

  final _themeControl = getIt.get<ThemeControl>();
  final _geolocation = getIt.get<IGeolocatorService>();
  final _cacheManager = getIt.get<ICacheManager>();

  Future<void> requestPermission() async {
    final permission = await _geolocation.requestPermission();
    print(permission);
  }

  Future<void> setIsNotFirstRun() async {
    await _cacheManager.save(ControllersEnum.firstRun, 'false');
  }
}
