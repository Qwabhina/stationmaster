import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/main.dart';
import 'package:stationmaster/src/constants/colors.dart';

class SettingsController extends GetxController {
  // Fetch user details from local storage
  final user = smBox.get("usr");

  // The default theme value (System)
  final defaultThemeLocal = smBox.get("themeMode", defaultValue: 0);

  // Set the app theme
  // RxInt radioTheme = 0.obs;
  setTheme(val) {
    smBox.put("themeMode", val);
  }

  // Show Change Phone Number Form
  Future<void> showChangePhoneNumberForm() {
    return showModalBottomSheet<void>(
      context: Get.overlayContext!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 600,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: smWhiteColor, backgroundColor: smPrimaryColor, padding: const EdgeInsets.all(10),
                      fixedSize: const Size(150, 50),
                      textStyle: Get.textTheme.headlineMedium,
                      elevation: 15,
                      shadowColor: smBlueLightest),
                  onPressed: () => Get.back(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Go Back".toUpperCase()),
                        const SizedBox(width: 20),
                        const Icon(
                          Ionicons.arrow_back_outline,
                        ),
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
