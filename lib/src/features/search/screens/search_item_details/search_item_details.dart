import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/search/controllers/search_item_controller.dart';

class SearchItemDetails extends StatelessWidget {
  const SearchItemDetails({Key? key, required this.searchItem})
      : super(key: key);

  // Search Item Details List
  final Map<String, dynamic> searchItem;

  // Page Body
  @override
  Widget build(BuildContext context) {
    final ctrl = SearchItemController();

    return Scaffold(
      backgroundColor: Get.theme.brightness == Brightness.light
          ? smPrimaryColor
          : smDarkColor,
      body: Column(children: [
        SizedBox(
          height: 120,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(children: [
              const SizedBox(height: 60),
              Row(children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Ionicons.arrow_back,
                    color: smWhiteColor,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  "Destination Details",
                  style: Get.textTheme.headlineMedium?.copyWith(
                    color: Get.theme.brightness == Brightness.light
                        ? smWhiteColor
                        : smSecondaryColor,
                  ),
                ),
              ]),
            ]),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Get.theme.brightness == Brightness.light
                  ? smWhiteColor
                  : smPrimaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 50),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                      child: Text(
                        searchItem["d_name"],
                        style: Get.textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: searchItem["icon"],
                        title: Text(searchItem["t_name"]),
                        subtitle: Text(searchItem["fare"]),
                      ),
                    ),
                  ]),
                ]),
          ),
        ),

        // Get Directions Button
        SizedBox(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: smBlueLightest, padding: const EdgeInsets.all(10), backgroundColor: smPrimaryColor,
                fixedSize: const Size(300, 80),
                textStyle: Get.textTheme.headlineSmall,
                elevation: 0),
            onPressed: () => ctrl.openMap(6.6993009, -1.6505214),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Get Directions".toUpperCase()),
                  const SizedBox(width: 20),
                  const Icon(Ionicons.open_outline),
                ]),
          ),
        ),
      ]),
    );
  }
}
