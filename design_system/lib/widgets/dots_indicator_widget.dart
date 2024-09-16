import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatelessWidget {
  final int count;
  final int position;
  const DotsIndicatorWidget({
    super.key,
    required this.count,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DotsIndicator(
      dotsCount: count,
      position: double.parse(position.toString()),
      decorator: DotsDecorator(
        size: const Size.square(16.0),
        activeSize: const Size(24.0, 16.0),
        color: colors.outline,
        activeColor: colors.secondary,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
