import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/colors.dart';

class TransportTypeDetails extends StatelessWidget {
  const TransportTypeDetails({Key? key, required this.details})
      : super(key: key);
  final Map<String, dynamic> details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: smPrimaryColor,
        shadowColor: smDarkColor,
        elevation: 15,
        title: Text(
          details["type"],
        ),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? smWhiteColor
          : smDarkColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: double.infinity,
              height: Get.height * 0.4,
              image: AssetImage(details['image']),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Card(
                    color: Theme.of(context).brightness == Brightness.light
                        ? smBlueLightest
                        : smPrimaryColor,
                    elevation: 10,
                    shadowColor: Get.theme.brightness == Brightness.light
                        ? smBlueLightest.withOpacity(0.5)
                        : smDarkColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(
                          Ionicons.information_circle,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? smPrimaryColor
                                  : smSecondaryColor,
                        ),
                        title: Text(
                          "Capacity",
                          style: Get.textTheme.headlineSmall!.copyWith(
                            color: Get.theme.brightness == Brightness.light
                                ? smPrimaryColor
                                : smSecondaryColor,
                          ),
                        ),
                        subtitle: Text(details['capacity'],
                            style: Get.textTheme.titleSmall),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    details['desc'],
                    textAlign: TextAlign.justify,
                    style: Get.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
