sealed class SettingsState {}

class IdleSettingsState implements SettingsState {}

class LoadingSettingsState implements SettingsState {}

class SuccessSettingsState implements SettingsState {}

class ErrorSettingsState implements SettingsState {
  final String message;
  const ErrorSettingsState(this.message);
}
