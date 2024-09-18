sealed class InitializationState {}

class LoadingInitializationState implements InitializationState {}

class SuccessInitializationState implements InitializationState {}

class ErrorInitializationState implements InitializationState {
  final String message;
  const ErrorInitializationState(this.message);
}
