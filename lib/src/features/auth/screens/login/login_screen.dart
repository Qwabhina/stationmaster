import 'package:flutter/material.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/sizes.dart';
import 'package:stationmaster/src/features/auth/screens/login/widgets/login_footer_widget.dart';
import 'package:stationmaster/src/features/auth/screens/login/widgets/login_form_widget.dart';
import 'package:stationmaster/src/features/auth/screens/login/widgets/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              child: Column(children: [
                //*** Section 1
                LoginHeaderWidget(size: size),
                //*** Section 2
                const LoginForm(),
                const SizedBox(height: 10.0),
                const LoginFooterWidget(),
              ]),
            ),
          )),
    );
  }
}
