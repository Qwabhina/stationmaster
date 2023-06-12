import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationmaster/src/constants/text_strings.dart';
import 'package:stationmaster/src/features/auth/screens/login/login_screen.dart';

class SignupFooterWidget extends StatelessWidget {
  const SignupFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.to(() => const LoginScreen()),
      child: Text.rich(
        TextSpan(text: smAlreadyHaveAccount, children: [
          TextSpan(
            text: "  Sign In",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ]),
      ),
    );
  }
}
