import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/auth/controllers/homepage_controller.dart';
import 'package:animations/animations.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCtrl = HomepageController();

    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? smWhiteColor
              : smDarkColor,

          // Body
          body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 450),
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secAnimation,
            ) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secAnimation,
                child: child,
              );
            },
            child: homeCtrl.pages[homeCtrl.selectedIndex.value],
          ),

          // Bottom Navigation
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : smPrimaryColor,
              currentIndex: homeCtrl.selectedIndex.value,
              onTap: homeCtrl.onItemTapped,
              elevation: 20,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor:
                  Theme.of(context).brightness == Brightness.light
                      ? smAccentColor
                      : smBlueLightest,
              unselectedItemColor:
                  Theme.of(context).brightness == Brightness.light
                      ? smPrimaryColor
                      : smBlueLighter,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(color: smPrimaryColor),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Ionicons.home_outline),
                  activeIcon: Icon(Ionicons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Ionicons.search_outline),
                  activeIcon: Icon(Ionicons.search),
                  label: "Search History",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Ionicons.settings_outline),
                  activeIcon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ]),
        ),
      ),
    );
  }
}
