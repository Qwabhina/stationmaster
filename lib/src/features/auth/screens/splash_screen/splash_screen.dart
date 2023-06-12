import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/image_strings.dart';
// import 'package:stationmaster/src/constants/sizes.dart';
// import 'package:stationmaster/src/constants/text_strings.dart';
import 'package:stationmaster/src/features/auth/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();

    return Scaffold(
        body: Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Get.theme.brightness == Brightness.light
                    ? const AssetImage(smAppLogoL)
                    : const AssetImage(smAppLogoD))),
      ),
    ));
  }
}
