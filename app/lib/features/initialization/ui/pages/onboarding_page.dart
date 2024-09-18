import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/initialization/data/models/onboarding_step_enum.dart';
import 'package:weather_app/features/initialization/ui/bloc/initialization_cubit.dart';
import 'package:weather_app/features/initialization/ui/widgets/onboarding_item_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<InitializationCubit>(context);

    return Scaffold(
      body: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _activePage = page;
                    });
                  },
                  children: [
                    OnboardingItemWidget(
                      cubit: cubit,
                      step: OnboardingStepEnum.stepOne,
                      pageController: _pageController,
                    ),
                    OnboardingItemWidget(
                      cubit: cubit,
                      step: OnboardingStepEnum.stepTwo,
                      pageController: _pageController,
                    ),
                    OnboardingItemWidget(
                      cubit: cubit,
                      step: OnboardingStepEnum.stepThree,
                      pageController: _pageController,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 100,
                  child: DotsIndicatorWidget(
                    count: 3,
                    position: _activePage,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
