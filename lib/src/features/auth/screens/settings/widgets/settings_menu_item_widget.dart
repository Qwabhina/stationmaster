import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/colors.dart';

class SettingsMenuItem extends StatelessWidget {
  final IconData icn;
  final String title;
  final String subtitle;

  const SettingsMenuItem({
    Key? key,
    required this.icn,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Get.theme.brightness == Brightness.light
              ? Colors.white
              : smDarkColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Get.theme.brightness == Brightness.light
                  ? smBlueLightest.withOpacity(0.5)
                  : smDarkColor.withOpacity(0.5),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ]),
      child: ListTile(
        leading: Icon(
          icn,
          size: 25,
          color: Get.theme.brightness == Brightness.light
              ? smPrimaryColor
              : smSecondaryColor,
        ),
        title: Text(title,
            style: Get.textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Get.theme.brightness == Brightness.light
                  ? smPrimaryColor
                  : smWhiteColor,
            )),
        subtitle: Text(subtitle,
            style: Get.textTheme.titleMedium!.copyWith(
              color: Get.theme.brightness == Brightness.light
                  ? smPrimaryColor
                  : smBlueLightest,
            )),
        trailing: Icon(
          Ionicons.arrow_forward_outline,
          size: 20,
          color: Get.theme.brightness == Brightness.light
              ? smPrimaryColor
              : smSecondaryColor,
        ),
      ),
    );
  }
}
