import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/auth/controllers/dashboard_controller.dart';
import 'package:stationmaster/src/features/auth/models/destination_model.dart';
import 'package:stationmaster/src/features/auth/screens/dashboard/widgets/transport_types/transport_types_list_widget.dart';
import 'package:stationmaster/src/features/search/screens/search_item_details/search_item_details.dart';
import 'package:stationmaster/src/utils/controllers/sm_controller.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  final DashboardController ctrl;

  @override
  Widget build(BuildContext context) {
    // Main App Controller
    final sm = SmController();

    // Body Section
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.brightness == Brightness.light
              ? smWhiteColor
              : smDarkColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(children: [
          const SizedBox(height: 30),

          // Title Text for the Search Section
          // This is the Row for the Big Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Where To?",
                      style: Get.textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? smPrimaryColor
                            : smSecondaryColor,
                      )),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),

          // This is the Row for the small title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Find a Lorry Terminal near you",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // The Search Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TypeAheadField<DestinationModel?>(
              debounceDuration: const Duration(milliseconds: 500),
              textFieldConfiguration: TextFieldConfiguration(
                autofocus: false,
                autocorrect: false,
                focusNode: ctrl.searchFocusNode,
                controller: ctrl.searchBoxCtrl,
                onChanged: (value) {},
                cursorColor: Theme.of(context).brightness == Brightness.light
                    ? smPrimaryColor
                    : smSecondaryColor,
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                  labelText: "Type Your Destination Here",
                  prefixIcon: const Icon(Ionicons.search),
                  prefixIconColor:
                      Theme.of(context).brightness == Brightness.light
                          ? smPrimaryColor
                          : smSecondaryColor,
                  suffixIcon: IconButton(
                    onPressed: () {
                      ctrl.searchBoxCtrl.text.isEmpty
                          ? ctrl.searchFocusNode.unfocus()
                          : ctrl.searchBoxCtrl.clear();
                    },
                    icon: const Icon(Ionicons.close),
                  ),
                  // suffixIconColor: _searchTerminal.text.isEmpty
                  //     ? AppStyles.white
                  //     : AppStyles.primary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              suggestionsCallback: DestinationsApi.getSuggestions,
              itemBuilder: (context, DestinationModel? d) {
                final destination = d!;

                return ListTile(
                  dense: true,
                  trailing: destination.dId == ""
                      ? const SizedBox()
                      : Icon(
                          Ionicons.arrow_forward,
                          color: Get.theme.brightness == Brightness.light
                              ? smSecondaryColor
                              : smBlueLightest,
                        ),
                  title: Text(
                    destination.dId == ""
                        ? destination.dName!
                        : "${destination.dName!} - GH¢${destination.fare}p",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Get.theme.brightness == Brightness.light
                              ? smPrimaryColor
                              : smSecondaryColor,
                        ),
                  ),
                  subtitle: Text(
                    destination.tName!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              },
              noItemsFoundBuilder: (context) => SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    'No results found',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              onSuggestionSelected: (DestinationModel? d) {
                final dest = d!.toJson();

                d.dId == ""
                    ? sm.showAlert(
                        d.dName.toString(),
                        "error",
                        Icons.error,
                      )
                    : Get.to(
                        () => SearchItemDetails(searchItem: dest),
                      );
              },
            ),
          ),

          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Common Transport Types",
                  style: Get.textTheme.headlineSmall?.copyWith(
                    color: Get.theme.brightness == Brightness.light
                        ? smPrimaryColor
                        : smBlueLightest,
                  ),
                ),
              ],
            ),
          ),

          //Common Transport Types
          const SizedBox(height: 20),
          const TransportTypesListWidget(),

          // White Space
          const SizedBox(height: 25),
        ]),
      ),
    );
  }
}
