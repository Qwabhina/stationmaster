import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stationmaster/main.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/auth/models/user/user_model.dart';
import 'package:stationmaster/src/features/auth/screens/login/login_screen.dart';

class SmController {
  // The default theme value (System)
  RxInt defaultTheme = 0.obs;

  // Open Local Storage
  initSmBox() async {
    // Initialize Hive
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    // Open Local Storage
    return Hive.openBox('smBox');
  }

  // Logout
  logout() async {
    await smBox.delete("usr");
    await smBox.delete("themeMode");
    Get.off(() => const LoginScreen());
  }

  // Dialog Colors
  Map<String, dynamic> dialogColors = {
    "success": Colors.green.shade700,
    "error": Colors.red.shade700,
    "info": Colors.blue.shade700,
    "warning": Colors.amber.shade700,
  };

  //Custom Dialog
  showAlert(String message, type, icon) {
    return showDialog(
        // barrierDismissible: false,
        useSafeArea: true,
        context: Get.overlayContext!,
        builder: (c) {
          return Center(
            child: Container(
              width: Get.width * 0.8,
              height: Get.height * 0.4,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: smWhiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: Icon(
                    icon,
                    color: dialogColors[type],
                    size: 80,
                  ),
                ),
                const Spacer(),
                Text(message,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.titleSmall
                        ?.copyWith(color: smPrimaryColor)),
                const Spacer(flex: 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Ok"),
                  ),
                ),
              ]),
            ),
          );
        });
  }

  // Determine user's internet connection status
  Future checkUserConnection() async {
    bool status;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        status = true;
      } else {
        status = false;
      }
    } on SocketException catch (_) {
      status = false;
    }

    return status;
  }

  // Check for Location Permission
  Future checkLocationPersmission() async {
    if (await Permission.location.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      return true;
    } else {
      return false;
    }
  }
}
