import 'package:design_system/design_system.dart';
import 'package:design_system/resources/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            label: context.textLocale.navigationBarWeatherLabel,
            icon: SvgPreviewWidget(
              iconPath: AppAssets.earth,
              color: context.colors.onSurface,
            ),
            selectedIcon: SvgPreviewWidget(
              iconPath: AppAssets.earthSolid,
              color: context.colors.surface,
              height: 28,
            ),
          ),
          NavigationDestination(
            label: context.textLocale.navigationBarSearchLabel,
            icon: SvgPreviewWidget(
              iconPath: AppAssets.searchSolid,
              color: context.colors.onSurface,
            ),
            selectedIcon: SvgPreviewWidget(
              iconPath: AppAssets.searchSolid,
              color: context.colors.surface,
              height: 28,
            ),
          ),
          NavigationDestination(
            label: context.textLocale.navigationBarSettingsLabel,
            icon: SvgPreviewWidget(
              iconPath: AppAssets.settings,
              color: context.colors.onSurface,
            ),
            selectedIcon: SvgPreviewWidget(
              iconPath: AppAssets.settingsSolid,
              color: context.colors.surface,
              height: 28,
            ),
          ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
