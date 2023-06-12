import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stationmaster/main.dart';
import 'package:stationmaster/src/constants/text_strings.dart';
import 'package:stationmaster/src/features/auth/models/user/user_model.dart';
import 'package:stationmaster/src/features/auth/screens/homepage/homepage_screen.dart';
import 'package:stationmaster/src/utils/controllers/sm_controller.dart';

class LoginController extends GetxController {
  // Determine User's Internet Status
  final sm = SmController();
  late bool internetStatus;
  // Loading Indicator
  RxBool isLoading = false.obs;
  // Password Visibility
  RxBool isObscure = true.obs;
  // Text Controllers
  final userIdText = TextEditingController();
  final userPassText = TextEditingController();

  processLogin(String u, String p) async {
    if (u.isEmpty || p.isEmpty) {
      sm.showAlert(
        "Empty Fields Found\nPlease fill all fields to continue.",
        "error",
        Icons.error,
      );
    } else {
      internetStatus = await sm.checkUserConnection();

      if (internetStatus) {
        await logUserIn(u, p);
      } else {
        sm.showAlert(
            "No internet detected.\nCheck your internet connection to continue.",
            "error",
            Icons.error);
      }
    }
  }

  // Log User in
  logUserIn(uid, upass) async {
    isLoading.value = true;

    var response = await http.post(
      Uri.parse("${smAPIServer}process-login.php"),
      body: {'user-id': uid, 'user-passwd': upass},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> user = json.decode(response.body);

      String msg = user['type'].toString();

      if (msg == "success") {
        var userData = UserModel.fromJson(user);

        await smBox.put("usr", userData);
        Get.off(() => const HomepageScreen());
      } else {
        isLoading.value = false;

        sm.showAlert(
          "Login Failed:\n ${user['content'].toString()}",
          "error",
          Icons.error,
        );
      }
    } else {
      isLoading.value = false;

      sm.showAlert(
        "An Error Occured:\n ${response.statusCode.toString()}",
        "error",
        Icons.error,
      );
    }
  }
}
