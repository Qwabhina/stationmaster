import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stationmaster/src/features/auth/screens/splash_screen/splash_screen.dart';
import 'package:stationmaster/src/utils/controllers/sm_controller.dart';
import 'package:stationmaster/src/utils/theme/theme.dart';

// The Hive box for Local storage
late Box smBox;
// Main Funtion
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  smBox = await SmController().initSmBox();

// Root App
  runApp(const App());

  // Color the status bar
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Get.theme.primaryColor,
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: smBox.listenable(),
        builder: (context, box, widget) {
          var themeModeValue = smBox.get("themeMode", defaultValue: 0);

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: SmAppTheme.lightTheme,
            darkTheme: SmAppTheme.darkTheme,
            themeMode: themeModeValue > 0
                ? (themeModeValue == 1 ? ThemeMode.light : ThemeMode.dark)
                : ThemeMode.system,
            home: SplashScreen(),
          );
        });
  }
}
