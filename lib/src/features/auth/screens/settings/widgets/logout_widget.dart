import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/settings_menu_item_widget.dart';
import 'package:stationmaster/src/utils/controllers/sm_controller.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Get.dialog(
          AlertDialog(
              title: const Text("Logout"),
              content: const Text("Are you sure you want to Logout?"),
              actions: <Widget>[
                TextButton(
                  child: const Text('No'),
                  onPressed: () => Get.back(),
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () => SmController().logout(),
                ),
              ]),
          barrierDismissible: false)),
      child: const SettingsMenuItem(
        icn: Ionicons.power,
        title: "Logout",
        subtitle: "Log Out of your Account",
      ),
    );
  }
}
