import 'package:design_system/design_system.dart';
import 'package:design_system/resources/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimationPreviewWidget(
          filePath: AppAssets.loading,
        ),
        const SizedBox(height: 16),
        Text(
          context.textLocale.loadingLabel,
          style: context.text.titleLarge,
        ),
      ],
    );
  }
}
