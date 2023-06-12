import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationmaster/src/constants/colors.dart';

class SettingsHeaderWidget extends StatelessWidget {
  const SettingsHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Settings",
              style: Get.textTheme.headlineMedium?.copyWith(
                  color: Get.theme.brightness == Brightness.light
                      ? smWhiteColor
                      : smSecondaryColor),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Get.theme.brightness == Brightness.light
                    ? smBlueLightest
                    : smSecondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.settings,
                color: Get.theme.brightness == Brightness.light
                    ? smPrimaryColor
                    : smDarkColor,
                size: 35,
              ),
            )
          ]),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
