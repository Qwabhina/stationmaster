import 'package:flutter/material.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/search/screens/search_history/widgets/search_history_list_widget.dart';
import 'package:stationmaster/src/features/search/screens/search_history/widgets/search_history_screen_header.dart';

class SearchHistoryScreen extends StatelessWidget {
  const SearchHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? smWhiteColor
          : smDarkColor,
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            // Page Header
            SearchHistoryScreenHeader(),
            SizedBox(height: 20),
            SearchHistoryList()
          ],
        ),
      ),
    );
  }
}
