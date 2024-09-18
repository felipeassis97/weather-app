import 'package:flutter/material.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:weather_app/features/settings/data/models/response/config__option_view_type.dart';
import 'package:weather_app/features/settings/ui/bloc/settings_cubit.dart';
import 'package:weather_app/features/settings/ui/widgets/collapsed_item_widget.dart';

class ExpandedItemWidget extends StatefulWidget {
  final SettingsCubit cubit;
  final ConfigOptionViewType type;
  final ThemeControl themeControl;
  const ExpandedItemWidget({
    super.key,
    required this.type,
    required this.cubit,
    required this.themeControl,
  });

  @override
  State<ExpandedItemWidget> createState() => _ExpandedItemWidgetState();
}

class _ExpandedItemWidgetState extends State<ExpandedItemWidget> {
  final _selectedValue = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollapsedItemWidget(
          type: widget.type,
          themeControl: widget.themeControl,
        ),
        ValueListenableBuilder(
            valueListenable: _selectedValue,
            builder: (context, selectedValue, _) {
              return Wrap(
                children: List.generate(_currentList.length, (index) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<int>(
                          value: index,
                          groupValue: selectedValue,
                          onChanged: (int? value) {
                            if (value != null) {
                              _selectedValue.value = value;
                              onTapItem(value);
                            }
                          }),
                      const SizedBox(width: 2),
                      Text(
                        _currentList[index],
                        style: context.text.bodyMedium?.copyWith(
                          color: context.colors.tertiary,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  );
                }),
              );
            }),
      ],
    );
  }

  void onTapItem(int index) async {
    if (widget.type == ConfigOptionViewType.theme) {
      final theme = widget.themeControl.supportedThemes[index];
      await widget.cubit.savePreferenceTheme(theme);
    } else if (widget.type == ConfigOptionViewType.language) {
      final locale = widget.themeControl.supportedLocales[index];
      await widget.cubit.savePreferenceLanguage(locale);
    }
  }

  List<String> get _currentList {
    if (widget.type == ConfigOptionViewType.theme) {
      return widget.themeControl.supportedThemes
          .map((e) => e.toString(context.textLocale))
          .toList();
    } else {
      return widget.themeControl.supportedLocales
          .map((e) => e.toString(context.textLocale))
          .toList();
    }
  }
}
