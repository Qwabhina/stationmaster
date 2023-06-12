import 'package:get/get.dart';
import 'package:stationmaster/main.dart';
import 'package:stationmaster/src/features/auth/screens/homepage/homepage_screen.dart';
import 'package:stationmaster/src/features/auth/screens/onboarding/onboarding_screen.dart';
import 'package:stationmaster/src/features/auth/screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  // Determine whether to animate or not
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3500));

    // Proceed to next page
    await smBox.get("firstRun", defaultValue: 0) == 1
        ? (smBox.keys.contains("usr")
            ? Get.off(() => const HomepageScreen())
            : Get.off(() => const WelcomeScreen()))
        : Get.off(() => const OnBoardingScreen());
  }
}
