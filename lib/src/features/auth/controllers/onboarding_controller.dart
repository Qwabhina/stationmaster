import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:stationmaster/main.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/image_strings.dart';
import 'package:stationmaster/src/constants/text_strings.dart';
import 'package:stationmaster/src/features/auth/models/onboarding_model.dart';
import 'package:stationmaster/src/features/auth/screens/onboarding/onboarding_page_widget.dart';
import 'package:stationmaster/src/features/auth/screens/welcome/welcome_screen.dart';

class OnBoardingController extends GetxController {
  // Controller For Liquid Swipe
  final ctrl = LiquidController();
  // Current Page Index for Slider
  RxInt currentPage = 0.obs;

  // page List for OnBoarding Page
  final pages = [
    OnBoardingPageWidget(
      ob: OnBoardingModel(
        image: smObfImage1,
        title: smObTitle1,
        subtitle: smObSubTitle1,
        gColor1: smObPage1l,
        gColor2: smObPage1d,
        titleColor: smWhiteColor,
        subTitleColor: smBlueLightest,
      ),
    ),
    OnBoardingPageWidget(
      ob: OnBoardingModel(
        image: smObfImage2,
        title: smObTitle2,
        subtitle: smObSubTitle2,
        gColor1: smObPage2l,
        gColor2: smObPage2d,
        titleColor: smDarkColor,
        subTitleColor: smDarkColor,
      ),
    ),
    OnBoardingPageWidget(
      ob: OnBoardingModel(
        image: smObfImage3,
        title: smObTitle3,
        subtitle: smObSubTitle3,
        gColor1: smObPage3l,
        gColor2: smObPage3d,
        titleColor: smWhiteColor,
        subTitleColor: smBlueLightest,
      ),
    ),
  ];

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  // Skip Function
  skip() => ctrl.jumpToPage(page: 2);

  // Next Slide
  animateToNextSlide() {
    int nextPage = ctrl.currentPage + 1;

    // Animate based on current page
    ctrl.currentPage < 2 ? ctrl.animateToPage(page: nextPage) : firstRun();
  }

  firstRun() {
    smBox.put("firstRun", 1);
    Get.off(() => const WelcomeScreen());
  }
}
