import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/auth/controllers/settings_controller.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/about_sm_widget.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/change_password_widget.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/change_theme_widget.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/logout_widget.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/settings_header_widget.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/settings_menu_item_widget.dart';
import 'package:stationmaster/src/utils/controllers/sm_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller
    final ctrl = SettingsController();

    return Scaffold(
      backgroundColor: Get.theme.brightness == Brightness.light
          ? smPrimaryColor
          : smDarkColor,
      body: SafeArea(
        child: Column(children: [
          const SettingsHeaderWidget(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.brightness == Brightness.light
                    ? smWhiteColor
                    : smPrimaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  children: [
                    const SizedBox(height: 30),
                    // Profile Picture
                    Center(
                      child: Stack(alignment: Alignment.center, children: [
                        SizedBox(
                          width: Get.width,
                          height: 165,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Get.theme.brightness == Brightness.light
                                    ? smPrimaryColor
                                    : smDarkColor,
                                borderRadius: BorderRadius.circular(20)),
                            width: (Get.width - 80),
                            height: 100,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Avatar(
                            placeholderColors: const [smSecondaryColor],
                            loader: const Center(
                                child: CircularProgressIndicator()),
                            name: ctrl.user.fullname.toString(),
                            // sources: [
                            //   NetworkSource("assets/images/profile.jpg"),
                            //   GenericSource(
                            //     const AssetImage("assets/images/profile.jpg"),
                            //   ),
                            // ],
                            shape: AvatarShape.circle(50),
                          ),
                        ),
                        Positioned(
                            bottom: 25,
                            child: Text(ctrl.user.fullname,
                                style: Get.textTheme.headlineSmall!.copyWith(
                                  color: smWhiteColor,
                                ))),
                      ]),
                    ),
                    const SizedBox(height: 40),
                    // Phone Number
                    InkWell(
                      onTap: () {
                        // ctrl.showChangePhoneNumberForm();
                        SmController().showAlert(
                          "This Feature is coming soon in future updates.\nDo stay tuned.",
                          "info",
                          Ionicons.information_circle,
                        );
                      },
                      child: SettingsMenuItem(
                        icn: Ionicons.phone_portrait,
                        title: "Phone Number",
                        subtitle: ctrl.user.phone.toString(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Change Password
                    const ChangePasswordWidget(),
                    const SizedBox(height: 20),

                    // Change Theme
                    ChangeThemeWidget(ctrl: ctrl),
                    const SizedBox(height: 20),

                    // About Station Master
                    const AboutSmWidget(),
                    const SizedBox(height: 20),

                    // Logout
                    const LogoutWidget(),
                    const SizedBox(height: 10),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
