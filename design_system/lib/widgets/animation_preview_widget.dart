import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPreviewWidget extends StatelessWidget {
  final String filePath;
  const AnimationPreviewWidget({
    super.key,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(filePath, package: 'design_system');
  }
}
