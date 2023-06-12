import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/auth/controllers/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final oc = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: oc.pages,
            liquidController: oc.ctrl,
            onPageChangeCallback: oc.onPageChangedCallback,
            slideIconWidget: Obx(() => Icon(
                  Ionicons.chevron_back_outline,
                  color:
                      oc.currentPage.value == 1 ? smBlueLightest : smDarkColor,
                )),
            enableSideReveal: true,
            enableLoop: false,
          ),

          // Proceed Button
          Obx(
            () => Positioned(
              bottom: 50.0,
              child: OutlinedButton(
                onPressed: () => oc.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: oc.currentPage.value == 1
                        ? smDarkColor
                        : smSecondaryColor,
                  ),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20.0),
                ),
                child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: oc.currentPage.value == 1
                          ? smDarkColor
                          : smSecondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Ionicons.arrow_forward,
                      color: oc.currentPage.value == 1
                          ? smBlueLightest
                          : smDarkColor,
                    )),
              ),
            ),
          ),

          //Skip Button
          Obx(
            () => Visibility(
              visible: oc.currentPage.value == 2 ? false : true,
              child: Positioned(
                top: 50,
                right: 40,
                child: TextButton(
                  onPressed: () => oc.skip(),
                  child: Text(
                    "Skip >>",
                    style: TextStyle(
                      color: oc.currentPage.value == 1
                          ? smDarkColor
                          : smBlueLightest,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // SmoohIndicator
          Obx(
            () => Positioned(
              bottom: 15,
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: oc.currentPage.value,
                effect: ExpandingDotsEffect(
                  expansionFactor: 3,
                  dotColor:
                      oc.ctrl.currentPage == 1 ? smWhiteColor : smBlueLighter,
                  activeDotColor:
                      oc.ctrl.currentPage == 1 ? smDarkColor : smSecondaryColor,
                  dotWidth: 15.0,
                  dotHeight: 10.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
