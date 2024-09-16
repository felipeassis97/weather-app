import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/routes/route_name.dart';
import 'package:weather_app/features/search/ui/bloc/search_cubit.dart';
import 'package:weather_app/features/search/ui/pages/search_page.dart';

final searchRoutes = GoRoute(
  path: RouteName.search,
  name: RouteName.search,
  builder: (context, state) => BlocProvider(
    create: (context) => SearchCubitCubit(),
    child: const SearchPage(),
  ),
);
