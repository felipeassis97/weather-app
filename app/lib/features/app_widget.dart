import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/common/routes/router_manager.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/common/services/theme_control/theme_control.dart';
import 'package:weather_app/l10n/app_localizations.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final ThemeControl themeControl;

  @override
  void initState() {
    super.initState();
    themeControl = getIt.get<ThemeControl>();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeControl.updated,
        builder: (context, theme, _) {
          return MaterialApp.router(
            title: 'Weather App',
            debugShowCheckedModeBanner: false,
            routerConfig: goRouter,
            theme: CustomTheme.theme(
              context,
              config: themeControl.config,
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('pt'),
              Locale('es'),
            ],
            locale: themeControl.locale,
          );
        });
  }
}
