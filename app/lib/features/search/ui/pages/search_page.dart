import 'package:flutter/material.dart';
import 'package:weather_app/common/utils/extensions/context_extension.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.scaffoldColor,
        title: Text(context.textLocale.navigationBarSearchLabel),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: context.textLocale.homeSearchLabel,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: context.colors.tertiary,
              ),
              border: InputBorder.none,
            ),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
