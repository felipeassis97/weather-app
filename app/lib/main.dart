import 'package:flutter/material.dart';
import 'package:weather_app/common/service_locator/main_service_locator.dart';
import 'package:weather_app/features/app_widget.dart';
import 'package:timezone/data/latest.dart' as tzdata;

void main() {
  _initialize();
  runApp(const AppWidget());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  tzdata.initializeTimeZones();
  MainServiceLocator.init();
}
