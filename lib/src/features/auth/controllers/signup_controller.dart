import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;
import 'package:stationmaster/src/constants/text_strings.dart';
import 'package:stationmaster/src/features/auth/screens/login/login_screen.dart';
import 'package:stationmaster/src/utils/controllers/sm_controller.dart';

class SignUpController extends GetxController {
  // Determine User's Internet Status
  final sm = SmController();
  late bool internetStatus;
  // Loading Indicator
  RxBool isLoading = false.obs;
  // Password Visibility
  RxBool isObscure = true.obs;

  // Text Editing Controllers
  final fnText = TextEditingController();
  final emText = TextEditingController();
  final pnText = TextEditingController();
  final pwText = TextEditingController();

  // Sign User up
  signUserUp(f, e, p, pw) async {
    isLoading.value = true;

    var response = await http.post(
      Uri.parse("${smAPIServer}process-registration.php"),
      body: {
        'full-name': f,
        'user-email': e,
        'user-phone': p,
        'passwd': pw,
        '_register': 'Register'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> user = json.decode(response.body);

      String msg = user['type'].toString();
      if (msg == "success") {
        // Provide Feedback to User
        sm.showAlert(
          user['content'],
          user['type'],
          Ionicons.checkmark_circle,
        );
        // Pause for some time
        await Future.delayed(const Duration(milliseconds: 3500));
        // Proceed to Login Screen
        Get.off(() => const LoginScreen());
      } else {
        isLoading.value = false;

// Provide Feedback to User
        sm.showAlert(
          "Sign Up Failed:\n ${user['content'].toString()}",
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
      // throw "Search Results could not be found.";
    }
  }

// Check Form Validation and Sign User up
  processSignUp(fn, em, pn, pw) async {
    if (fn.isEmpty || em.isEmpty || pn.isEmpty || pw.isEmpty) {
      // Provide Feedback to User
      sm.showAlert(
        "Empty Fields Found\nPlease fill all fields to continue.",
        "error",
        Icons.error,
      );
    } else if (pn.length != 10) {
      sm.showAlert(
        "Invalid Phone Number\nYour phone number appears to be invalid.",
        "warning",
        Icons.warning,
      );
    } else {
      internetStatus = await sm.checkUserConnection();

      if (internetStatus) {
        await signUserUp(fn, em, pn, pw);
      } else {
        sm.showAlert(
            "No internet detected.\nCheck your internet connection to continue.",
            "error",
            Icons.error);
      }
    }
  }
}
