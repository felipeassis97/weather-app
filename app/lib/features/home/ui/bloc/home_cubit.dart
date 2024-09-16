import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/geolocator/i_geolocation_service.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/features/home/ui/bloc/home_state.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/features/home/data/repository/i_weather_repository.dart';
import 'package:weather_app/features/home/data/models/request/load_params_request_model.dart';

final class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(LoadingHomeState());

  final _themeControl = getIt.get<ThemeControl>();
  final _geolocation = getIt.get<IGeolocatorService>();
  final _weatherRepository = getIt.get<IWeatherRepository>();

  Future<void> loadForecast() async {
    emit(LoadingHomeState());

    final (lat, lng) = await _geolocation.getCurrentPosition();
    final (weather, error) = await _weatherRepository.loadCurrentData(
      LoadParamsRequestModel(coordinates: (lat, lng)),
    );

    if (error != null) {
      emit(const ErrorHomeState('Error message'));
      return;
    }

    if (weather!.location.localtime.hour > 18) {
      _themeControl.setNewContrast(Contrast.night);
    } else {
      _themeControl.setNewContrast(Contrast.day);
    }

    emit(SuccessHomeState(weather));
  }
}
