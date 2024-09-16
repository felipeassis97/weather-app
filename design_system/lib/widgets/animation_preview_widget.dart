import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPreviewWidget extends StatelessWidget {
  final String filePath;
  final double? height;
  final double? width;
  const AnimationPreviewWidget({
    super.key,
    required this.filePath,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Lottie.asset(
          filePath,
          package: 'design_system',
        ));
  }
}
