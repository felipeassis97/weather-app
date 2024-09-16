import 'package:weather_app/features/home/data/models/response/weather_model.dart';

sealed class HomeState {}

class LoadingHomeState implements HomeState {}

class SuccessHomeState implements HomeState {
  final Weather weather;
  const SuccessHomeState(this.weather);
}

class ErrorHomeState implements HomeState {
  final String message;
  const ErrorHomeState(this.message);
}
