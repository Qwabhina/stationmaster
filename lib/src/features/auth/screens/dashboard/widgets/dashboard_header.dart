import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/image_strings.dart';
import 'package:stationmaster/src/features/auth/controllers/dashboard_controller.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  final DashboardController ctrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // App Logo
            Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      // image: Get.theme.brightness == Brightness.light
                      //     ? const AssetImage(smAppLogoD)
                      //     : const AssetImage(smAppLogoL),
                      image: AssetImage(smAppLogoD),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),

            // User Name and greetings
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                ctrl.greet(),
                style: Get.textTheme.titleMedium?.copyWith(
                    // color: Get.theme.brightness == Brightness.light
                    //     ? smSecondaryColor
                    //     : smPrimaryColor),
                    color: smSecondaryColor),
              ),
              const SizedBox(height: 5),
              Text(
                ctrl.user.shortName.toString(),
                style: Get.textTheme.headlineSmall?.copyWith(
                    // color: Get.theme.brightness == Brightness.light
                    //     ? smWhiteColor
                    //     : smDarkColor,
                    color: smWhiteColor),
              ),
            ]),
          ]),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
