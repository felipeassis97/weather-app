import 'package:design_system/design_system.dart';
import 'package:design_system/resources/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/common/routes/route_name.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/features/initialization/ui/bloc/initialization_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final bool isFirstRun;

  @override
  void initState() {
    super.initState();
    _animationControls();
    _loadUserPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPreviewWidget(
                iconPath: AppAssets.appIcon,
                height: 100,
              ),
              const SizedBox(height: 8),
              Text(
                'Weather now',
                style: context.text.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadUserPreferences() async {
    final cubit = BlocProvider.of<InitializationCubit>(context);
    await cubit.loadUserPreferences();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      isFirstRun = await cubit.checkIfFirstRun();

      Future.delayed(const Duration(seconds: 3), () async {
        if (mounted) {
          isFirstRun
              ? context.pushReplacementNamed(RouteName.onboarding)
              : context.pushReplacementNamed(RouteName.home);
        }
      });
    });
  }

  void _animationControls() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start the animation when the widget builds
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
