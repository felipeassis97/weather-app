import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/resources/utils/app_assets.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/features/settings/data/config_type.dart';

class CollapsedItemWidget extends StatelessWidget {
  final ConfigType type;
  final ThemeControl themeControl;

  const CollapsedItemWidget({
    super.key,
    required this.type,
    required this.themeControl,
  });

  @override
  Widget build(BuildContext context) {
    final (title, extra) = _title(context);
    final (icon) = _iconAsset(context);

    return ListTile(
      leading: SvgPreviewWidget(
        iconPath: icon,
        color: context.colors.onTertiary,
      ),
      title: Row(
        children: [
          Text(
            title,
            style: context.text.bodyLarge?.copyWith(
              color: context.colors.onTertiary,
            ),
          ),
          const Spacer(),
          Visibility(
            visible: extra != null,
            child: Text(extra ?? ''),
          ),
        ],
      ),
      trailing: const Icon(Icons.keyboard_arrow_down_sharp),
    );
  }

  String _iconAsset(BuildContext context) {
    final theme = themeControl.config.themeMode;

    if (type == ConfigType.theme) {
      if (theme == ThemeMode.light) {
        return (AppAssets.light);
      } else {
        return (AppAssets.dark);
      }
    } else {
      return (AppAssets.language);
    }
  }

  (String, String?) _title(BuildContext context) {
    switch (type) {
      case ConfigType.theme:
        return (
          context.textLocale.settingsModesTitle,
          themeControl.config.themeMode == ThemeMode.light
              ? context.textLocale.settingsModeLight
              : context.textLocale.settingsModeDark
        );
      case ConfigType.language:
        return (context.textLocale.settingsLanguagesTitle, null);
      default:
        throw Exception('Type not found');
    }
  }
}
