import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/search/ui/bloc/search_state.dart';

final class SearchCubitCubit extends Cubit<SearchState> {
  SearchCubitCubit() : super(LoadingSearchState());
}
