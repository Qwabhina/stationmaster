import 'package:get/get.dart';
import 'package:stationmaster/src/features/auth/screens/dashboard/dashboard_screen.dart';
import 'package:stationmaster/src/features/auth/screens/settings/settings_screen.dart';
import 'package:stationmaster/src/features/search/screens/search_history/search_history_screen.dart';

class HomepageController extends GetxController {
  // Index of Current Page
  RxInt selectedIndex = 0.obs;

  // List of Pges
  final pages = [
    const DashboardScreen(),
    const SearchHistoryScreen(),
    const SettingsScreen(),
  ];

  onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
