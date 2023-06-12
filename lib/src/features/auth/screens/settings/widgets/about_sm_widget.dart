import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/image_strings.dart';
import 'package:stationmaster/src/constants/text_strings.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/settings_menu_item_widget.dart';

class AboutSmWidget extends StatelessWidget {
  const AboutSmWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showAboutDialog(
          context: context,
          applicationIcon: Container(
              decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(smAppLogoL),
            ),
          )),
          applicationName: smAppName,
          applicationVersion: smAppVersion,
          applicationLegalese: smAppLegalese,
        );
      },
      child: const SettingsMenuItem(
        icn: Ionicons.information_circle,
        title: "About Station Master",
        subtitle: "Brief Information",
      ),
    );
  }
}
