import 'package:design_system/design_system.dart';
import 'package:design_system/resources/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/common/routes/route_name.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/features/initialization/data/models/onboarding_step_enum.dart';
import 'package:weather_app/features/initialization/ui/bloc/initialization_cubit.dart';

class OnboardingItemWidget extends StatefulWidget {
  final InitializationCubit cubit;
  final OnboardingStepEnum step;
  final PageController pageController;

  const OnboardingItemWidget({
    super.key,
    required this.step,
    required this.cubit,
    required this.pageController,
  });

  @override
  State<OnboardingItemWidget> createState() => _OnboardingItemWidgetState();
}

class _OnboardingItemWidgetState extends State<OnboardingItemWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.step == OnboardingStepEnum.stepTwo) {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        widget.cubit.requestPermission();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final (title, description, nextButton, skipButton, asset) = _texts(context);

    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            height: context.heightSize,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimationPreviewWidget(
                    filePath: asset,
                    height: context.heightSize * 0.36,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: context.text.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  description,
                  style: context.text.labelLarge?.copyWith(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () => _onTapNextButton(context),
                    style: context.elevatedButtonStyle?.copyWith(
                        minimumSize: const WidgetStatePropertyAll<Size>(
                      Size(140, 48),
                    )),
                    child: Text(nextButton)),
                const SizedBox(height: 64),
              ],
            )),
      ],
    );
  }

  void _onTapNextButton(BuildContext context) async {
    if (widget.step == OnboardingStepEnum.stepThree) {
      context.pushReplacementNamed(RouteName.home);
      await widget.cubit.setIsNotFirstRun();
    } else {
      widget.pageController.nextPage(
        duration: const Duration(microseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  (
    String title,
    String description,
    String nextButton,
    String skipButton,
    String assetPath
  ) _texts(BuildContext context) {
    switch (widget.step) {
      case OnboardingStepEnum.stepOne:
        return (
          context.textLocale.onboardingStepOneTitleLabel,
          context.textLocale.onboardingStepOneDescriptionLabel,
          context.textLocale.onboardingNextButton,
          context.textLocale.onboardingSkipButton,
          AppAssets.search
        );

      case OnboardingStepEnum.stepTwo:
        return (
          context.textLocale.onboardingStepTwoTitleLabel,
          context.textLocale.onboardingStepTwoDescriptionLabel,
          context.textLocale.onboardingNextButton,
          context.textLocale.onboardingSkipButton,
          AppAssets.location
        );

      case OnboardingStepEnum.stepThree:
        return (
          context.textLocale.onboardingStepThreeTitleLabel,
          context.textLocale.onboardingStepThreeDescriptionLabel,
          context.textLocale.onboardingStartButton,
          context.textLocale.onboardingSkipButton,
          AppAssets.favorites
        );
    }
  }
}
