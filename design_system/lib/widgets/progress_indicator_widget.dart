import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      //  value: 0.5,
      backgroundColor: Theme.of(context).colorScheme.outline,
      borderRadius: BorderRadius.circular(8),
      valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).colorScheme.outline,
      ),
    );

    // return StepProgressIndicator(
    //   totalSteps: maximum,
    //   currentStep: current,
    //   size: 4,
    //   padding: 0,
    //   roundedEdges: Radius.circular(10),
    //   selectedGradientColor: LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     colors: [
    //       Theme.of(context).colorScheme.secondary,
    //       Theme.of(context).colorScheme.error,
    //     ],
    //   ),
    //   unselectedGradientColor: LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     colors: [
    //       // Theme.of(context).colorScheme.onPrimary,
    //       Theme.of(context).colorScheme.outline,
    //     ],
    //   ),
    // );
  }
}
