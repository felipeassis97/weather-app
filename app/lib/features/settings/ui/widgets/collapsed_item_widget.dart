import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/resources/utils/app_assets.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/features/settings/data/models/response/config_option_view_type.dart';

class CollapsedItemWidget extends StatelessWidget {
  final ConfigOptionViewType type;
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
        color: context.colors.outlineVariant,
      ),
      title: Row(
        children: [
          Text(
            title,
            style: context.text.bodyLarge,
          ),
          const Spacer(),
          Visibility(
            visible: extra != null,
            child: Text(extra ?? ''),
          ),
        ],
      ),
      trailing: Icon(
        Icons.keyboard_arrow_down_sharp,
        color: context.colors.outlineVariant,
      ),
    );
  }

  String _iconAsset(BuildContext context) {
    final theme = themeControl.config.themeMode;

    if (type == ConfigOptionViewType.theme) {
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
      case ConfigOptionViewType.theme:
        return (
          context.textLocale.settingsModesTitle,
          themeControl.config.themeMode == ThemeMode.light
              ? context.textLocale.settingsModeLight
              : context.textLocale.settingsModeDark
        );
      case ConfigOptionViewType.language:
        return (context.textLocale.settingsLanguagesTitle, null);
      default:
        throw Exception('Type not found');
    }
  }
}
