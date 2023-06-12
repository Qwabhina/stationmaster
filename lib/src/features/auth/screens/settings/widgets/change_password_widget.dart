import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/features/auth/screens/settings/widgets/settings_menu_item_widget.dart';
import 'package:stationmaster/src/utils/controllers/sm_controller.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SmController().showAlert(
          "This Feature is coming soon in future updates.\nDo stay tuned.",
          "info",
          Ionicons.information_circle,
        );

        // showModalBottomSheet<void>(
        //   context: context,
        //   isScrollControlled: true,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(20),
        //       topRight: Radius.circular(20),
        //     ),
        //   ),
        //   builder: (BuildContext context) {
        //     return Container(
        //       height: 600,
        //       decoration: const BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(20),
        //           topRight: Radius.circular(20),
        //         ),
        //       ),
        //       child: Column(
        //         // mainAxisAlignment: MainAxisAlignment.center,
        //         mainAxisSize: MainAxisSize.max,
        //         children: <Widget>[
        //           Container(
        //             padding: const EdgeInsets.all(20),
        //             child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   TextFormField(
        //                     onChanged: (value) {},
        //                     cursorColor: smPrimaryColor,
        //                     style: Get.textTheme.subtitle1,
        //                     decoration: InputDecoration(
        //                       labelText: "Old Password",
        //                       prefixIcon: const Icon(Ionicons.key),
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(20),
        //                       ),
        //                     ),
        //                   ),
        //                   const SizedBox(height: 20),
        //                   TextFormField(
        //                     onChanged: (value) {},
        //                     cursorColor: smPrimaryColor,
        //                     style: Get.textTheme.subtitle1,
        //                     decoration: InputDecoration(
        //                       labelText: "New Password",
        //                       prefixIcon:
        //                           const Icon(Ionicons.lock_closed_outline),
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(20),
        //                       ),
        //                     ),
        //                   ),
        //                   const SizedBox(height: 10),
        //                   TextFormField(
        //                     onChanged: (value) {},
        //                     cursorColor: smPrimaryColor,
        //                     style: Get.textTheme.subtitle1,
        //                     decoration: InputDecoration(
        //                       labelText: "Type New Password Again",
        //                       prefixIcon: const Icon(Ionicons.lock_closed),
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(20),
        //                       ),
        //                     ),
        //                   ),
        //                 ]),
        //           ),
        //           ElevatedButton(
        //             style: ElevatedButton.styleFrom(
        //               padding: const EdgeInsets.all(10),
        //               fixedSize: const Size(150, 50),
        //               textStyle: Get.textTheme.subtitle2,
        //               elevation: 15,
        //             ),
        //             onPressed: () => Navigator.pop(context),
        //             child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Text("Go Back".toUpperCase()),
        //                   const SizedBox(height: 20),
        //                   const Icon(
        //                     Ionicons.arrow_back_outline,
        //                   ),
        //                 ]),
        //           )
        //         ],
        //       ),
        //     );
        //   },
        // );
      },
      child: const SettingsMenuItem(
        icn: Ionicons.key,
        title: "Change Password",
        subtitle: "Change your account Password",
      ),
    );
  }
}
