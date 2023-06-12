import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/main.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/auth/controllers/settings_controller.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/settings_menu_item_widget.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  final SettingsController ctrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (BuildContext context) {
            return Container(
              height: Get.height * 0.45,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Get.theme.brightness == Brightness.light
                    ? Colors.white
                    : smPrimaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ValueListenableBuilder(
                  valueListenable: smBox.listenable(keys: ["themeMode"]),
                  builder: (context, box, widget) {
                    return Column(
                      children: [
                        RadioListTile(
                          title: Text("Use System Theme",
                              style: Get.textTheme.titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          value: 0,
                          groupValue: smBox.get("themeMode", defaultValue: 0),
                          // groupValue: ctrl.radioTheme,
                          // onChanged: (value) => ctrl.changeTheme(value),
                          onChanged: (value) => ctrl.setTheme(value),
                        ),
                        RadioListTile(
                          title: Text("Light Theme",
                              style: Get.textTheme.titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          value: 1,
                          groupValue: smBox.get("themeMode", defaultValue: 0),
                          // groupValue: ctrl.radioTheme,
                          // onChanged: (value) => ctrl.changeTheme(value),
                          onChanged: (value) => ctrl.setTheme(value),
                        ),
                        RadioListTile(
                          title: Text("Dark Theme",
                              style: Get.textTheme.titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          value: 2,
                          groupValue: smBox.get("themeMode", defaultValue: 0),
                          // groupValue: ctrl.radioTheme,
                          onChanged: (value) => ctrl.setTheme(value),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (() => Get.back()),
                            child: const Text("Save"),
                          ),
                        ),
                      ],
                    );
                  }),
            );
          },
        );
      },
      child: const SettingsMenuItem(
        icn: Ionicons.color_palette,
        title: "Change Theme",
        subtitle: "Switch to Dark/Light Theme",
      ),
    );
  }
}
