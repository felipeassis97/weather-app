sealed class OnboardingState {}

class LoadingOnboardingState implements OnboardingState {}

class SuccessOnboardingState implements OnboardingState {}

class ErrorOnboardingState implements OnboardingState {
  final String message;
  const ErrorOnboardingState(this.message);
}
