import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/image_strings.dart';
import 'package:stationmaster/src/constants/sizes.dart';
import 'package:stationmaster/src/constants/text_strings.dart';
import 'package:stationmaster/src/features/auth/screens/login/login_screen.dart';
import 'package:stationmaster/src/features/auth/screens/signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? smWhiteColor
          : smDarkColor,
      body: Container(
        padding: const EdgeInsets.all(smDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: Theme.of(context).brightness == Brightness.light
                  ? const AssetImage(smAppLogoL)
                  : const AssetImage(smAppLogoD),
              height: size.height * 0.5,
              width: size.width * 0.5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  smWelcomeTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  smWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.off(() => const SignUpScreen()),
                    child: Text("Sign Up".toUpperCase()),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.off(() => const LoginScreen()),
                    child: Text("Sign In".toUpperCase()),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
