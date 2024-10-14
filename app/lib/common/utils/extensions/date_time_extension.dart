import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';
import 'package:timezone/timezone.dart' as tz;

extension Formatter on DateTime {
  String fullDate(BuildContext context) {
    String localeString = context.currentLocale.toString();

    String dayOfWeek = DateFormat('EEEE', localeString).format(this);
    String day = DateFormat('d', localeString).format(this);
    String month = DateFormat('MMMM', localeString).format(this);

    return '${dayOfWeek[0].toUpperCase() + dayOfWeek.substring(1)}, $day de $month';
  }

  String formattedSimpleHour(BuildContext context) {
    String localeString = Localizations.localeOf(context).toString();
    String formattedHour = DateFormat('ha', localeString).format(this);
    return formattedHour.toLowerCase().replaceAll(' ', '');
  }

  String dayOfWeek(BuildContext context) {
    DateTime today = DateTime.now();
    String localeString = Localizations.localeOf(context).toString();

    if (year == today.year && month == today.month && day == today.day) {
      return context.textLocale.homeTodayLabel;
    } else {
      return DateFormat('EEEE', localeString).format(this);
    }
  }

  DateTime fromTzDateTime(String timezone) {
    final location = tz.getLocation(timezone);
    final tzDateTime = tz.TZDateTime.from(this, location);

    return DateTime(
      tzDateTime.year,
      tzDateTime.month,
      tzDateTime.day,
      tzDateTime.hour,
      tzDateTime.minute,
    );
  }

  DateTime dateFromTz(String timezone) {
    final location = tz.getLocation(timezone);
    final tzDateTime = tz.TZDateTime.from(this, location);

    return DateTime(
      tzDateTime.year,
      tzDateTime.month,
      tzDateTime.day,
      tzDateTime.hour,
      tzDateTime.minute,
    );
  }
}
