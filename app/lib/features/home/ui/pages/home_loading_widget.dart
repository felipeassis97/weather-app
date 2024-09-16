import 'package:design_system/design_system.dart';
import 'package:design_system/resources/utils/app_assets.dart';
import 'package:flutter/material.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimationPreviewWidget(
        filePath: AppAssets.loading,
      ),
    );
  }
}
