import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationmaster/main.dart';

class DashboardController extends GetxController {
  late FocusNode searchFocusNode = FocusNode();
  late List responseData;

  // Text editing controller for the search bar
  final TextEditingController searchBoxCtrl = TextEditingController();

  // Find User details from local Storage
  final user = smBox.get("usr");

  // Greetings Functions
  String greet() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour == 12) {
      return "Good Day";
    } else if (hour > 12 && hour < 16) {
      return "Good Afternoon";
    }
    return "Good Evening";
  }
}
