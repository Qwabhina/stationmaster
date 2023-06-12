import 'package:permission_handler/permission_handler.dart';
import 'package:stationmaster/src/utils/controllers/sm_controller.dart';
import 'package:android_intent_plus/android_intent.dart';

class SearchItemController {
  final sm = SmController();
  // Open Map
  openMap(double latitude, double longitude) async {
    //   Uri googleUrl = Uri.parse(
    //       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    //   if (await canLaunchUrl(googleUrl)) {
    //     await launchUrl(googleUrl);
    //   } else {
    //     Get.showSnackbar(const GetSnackBar(
    //       title: "Error",
    //       messageText: Text("Couldn't open the map"),
    //     ));
    //     // throw 'Could not open the map.';
    //   }
    final intent = AndroidIntent(
      action: 'action_view',
      data: Uri.encodeFull('geo:$latitude,$longitude?z=11'),
      package: 'com.google.android.apps.maps',
    );

    if (await sm.checkLocationPersmission()) {
      intent.launch();
    } else {
      Permission.location.request();
    }
  }
}
