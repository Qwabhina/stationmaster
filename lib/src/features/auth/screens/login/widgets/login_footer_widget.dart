import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationmaster/src/constants/text_strings.dart';
import 'package:stationmaster/src/features/auth/screens/signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.to(() => const SignUpScreen()),
      child: Text.rich(
        TextSpan(text: smDontHaveAccount, children: [
          TextSpan(
            text: "  Sign Up",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ]),
      ),
    );
  }
}
