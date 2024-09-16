import 'package:design_system/widgets/svg_preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';

class WeatherStatusItemWidget extends StatelessWidget {
  final String label;
  final String value;
  final String iconPath;
  const WeatherStatusItemWidget(
      {super.key,
      required this.label,
      required this.value,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPreviewWidget(
          iconPath: iconPath,
          height: 32,
          color: context.colors.tertiary,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: context.text.labelLarge?.copyWith(
            color: context.colors.tertiary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: context.text.bodySmall?.copyWith(
            color: context.colors.tertiary,
          ),
        ),
      ],
    );
  }
}
