import 'package:flutter/material.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.colors.onSurface,
      ),
    );
  }
}
