import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/colors.dart';

class SearchHistoryScreenHeader extends StatelessWidget {
  const SearchHistoryScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Search History",
            style: Get.textTheme.headlineMedium?.copyWith(
              color: Get.theme.brightness == Brightness.light
                  ? smPrimaryColor
                  : smSecondaryColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Get.theme.brightness == Brightness.light
                  ? smPrimaryColor
                  : smSecondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Ionicons.search,
              color: Get.theme.brightness == Brightness.light
                  ? smBlueLightest
                  : smDarkColor,
            ),
          )
        ],
      ),
    );
  }
}
