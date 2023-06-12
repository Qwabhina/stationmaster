import 'package:flutter/material.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/auth/controllers/dashboard_controller.dart';
import 'package:stationmaster/src/features/auth/screens/dashboard/widgets/dashboard_body.dart';
import 'package:stationmaster/src/features/auth/screens/dashboard/widgets/dashboard_header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dashboard Controller
    final dashbCtrl = DashboardController();

    // Dashboard Page Body
    return Scaffold(
      // backgroundColor: Theme.of(context).brightness == Brightness.light
      //     ? smPrimaryColor
      //     : smBlueLightest,
      backgroundColor: smPrimaryColor,
      body: SafeArea(
        child: Column(children: [
          DashboardHeader(ctrl: dashbCtrl),

          // Expanded Box to fill the remaining area of the screen
          // It has an only child (Container) which starts from where the curved edges are
          DashboardBody(ctrl: dashbCtrl),
        ]),
      ),
    );
  }
}
