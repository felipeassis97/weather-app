import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/features/home/ui/bloc/home_cubit.dart';
import 'package:weather_app/features/home/ui/bloc/home_state.dart';
import 'package:weather_app/features/home/ui/widgets/forecast_widget.dart';
import 'package:weather_app/common/widgets/feedbacks/loading_widget.dart';

class HomePage extends StatefulWidget {
  final ThemeControl themeControl;
  const HomePage({super.key, required this.themeControl});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeCubit>(context).loadForecast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: BlocProvider.of<HomeCubit>(context),
          builder: (context, state) {
            if (state is LoadingHomeState) {
              return const LoadingWidget();
            } else if (state is SuccessHomeState) {
              return Container(
                width: context.widthSize,
                height: context.heightSize - context.appBarHeight,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.colors.secondary,
                      context.colors.primary,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: PageView(
                  children: [
                    ForecastWidget(
                      weather: state.weather,
                      themeControl: widget.themeControl,
                    ),
                    ForecastWidget(
                      weather: state.weather,
                      themeControl: widget.themeControl,
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
    );
  }
}
