import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPreviewWidget extends StatelessWidget {
  final String iconPath;
  final double? height;
  final double? width;
  final Color? color;
  const SvgPreviewWidget({
    super.key,
    required this.iconPath,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(iconPath,
          height: height,
          width: width,
          colorFilter: color != null
              ? ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                )
              : null,
          package: 'design_system'),
    );
  }
}
