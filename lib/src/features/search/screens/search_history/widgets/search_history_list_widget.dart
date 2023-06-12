import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/search/screens/widgets/search_history_item.dart';
import 'package:stationmaster/src/utils/json/search_history_data.dart';

class SearchHistoryList extends StatelessWidget {
  const SearchHistoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: searchHistoryData.isNotEmpty
          ? ListView.builder(
              itemCount: searchHistoryData.length,
              itemBuilder: (context, index) {
                return SearchHistoryItem(item: searchHistoryData[index]);
              },
            )
          : Center(
              child: ListTile(
                title: Text(
                  "No Search History",
                  style: Get.textTheme.titleSmall?.copyWith(
                      color: Get.theme.brightness == Brightness.light
                          ? smPrimaryColor
                          : smWhiteColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
