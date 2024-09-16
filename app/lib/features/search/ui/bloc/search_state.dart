sealed class SearchState {}

class LoadingSearchState implements SearchState {}

class SuccessSearchState implements SearchState {}

class ErrorSearchState implements SearchState {
  final String message;
  const ErrorSearchState(this.message);
}
