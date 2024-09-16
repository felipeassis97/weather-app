import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/features/settings/data/config_type.dart';
import 'package:weather_app/features/settings/ui/widgets/collapsed_item_widget.dart';
import 'package:weather_app/features/settings/ui/widgets/expanded_item_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<ConfigType> _configs = [ConfigType.theme, ConfigType.language];
  final themeControl = getIt.get<ThemeControl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.scaffoldColor,
        title: Text(context.textLocale.settingsAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _configs.length,
          itemBuilder: (context, index) {
            return ExpandableWidget(
              collapsed: CollapsedItemWidget(
                type: _configs[index],
                themeControl: themeControl,
              ),
              expanded: ExpandedItemWidget(
                type: _configs[index],
                themeControl: themeControl,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
