import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/features/settings/data/models/response/config_option_view_type.dart';
import 'package:weather_app/features/settings/ui/bloc/settings_cubit.dart';
import 'package:weather_app/features/settings/ui/widgets/collapsed_item_widget.dart';
import 'package:weather_app/features/settings/ui/widgets/expanded_item_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final themeControl = getIt.get<ThemeControl>();
  final List<ConfigOptionViewType> _configs = [
    ConfigOptionViewType.theme,
    ConfigOptionViewType.language
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);

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
                cubit: cubit,
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
