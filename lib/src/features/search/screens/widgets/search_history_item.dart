import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationmaster/src/constants/colors.dart';

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Get.theme.brightness == Brightness.light
                  ? smBlueLightest.withOpacity(0.5)
                  : Colors.black.withOpacity(0.5),
              blurRadius: 15,
              offset: const Offset(0, 8))
        ],
        color: Get.theme.brightness == Brightness.light
            ? Colors.white
            : smPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            item["d_name"],
            style: Get.textTheme.headlineSmall?.copyWith(
              color: Get.theme.brightness == Brightness.light
                  ? smPrimaryColor
                  : smWhiteColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "GH¢${item['fare']}p",
            style: Get.textTheme.titleMedium?.copyWith(
                color: Get.theme.brightness == Brightness.light
                    ? smPrimaryColor
                    : smBlueLightest),
          ),
          const SizedBox(height: 15),
          Text(
            item["t_name"],
            style: Get.textTheme.titleSmall?.copyWith(
                color: Get.theme.brightness == Brightness.light
                    ? smPrimaryColor
                    : smBlueLightest,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.visible,
          ),
          Text(
            item["timeofsearch"],
            style: Get.textTheme.bodyLarge?.copyWith(
                color: Get.theme.brightness == Brightness.light
                    ? smPrimaryColor
                    : smSecondaryColor),
          ),
        ]),
      ]),
    );
  }
}
