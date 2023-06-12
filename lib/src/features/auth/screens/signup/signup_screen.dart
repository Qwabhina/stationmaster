import 'package:flutter/material.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/sizes.dart';
import 'package:stationmaster/src/features/auth/screens/signup/widgets/signup_footer_widget.dart';
import 'package:stationmaster/src/features/auth/screens/signup/widgets/signup_form_widget.dart';
import 'package:stationmaster/src/features/auth/screens/signup/widgets/signup_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? smWhiteColor
            : smDarkColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(smDefaultSize),
            child: Column(
              children: [
                SignupHeaderWidget(size: size),
                const SignupFormWidget(),
                const SignupFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
