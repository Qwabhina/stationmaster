import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/features/auth/screens/dashboard/widgets/transport_types/transport_type_details.dart';

class TransportTypeWidget extends StatelessWidget {
  const TransportTypeWidget({Key? key, required this.typeItem})
      : super(key: key);

  // Transport Type Item
  final Map<String, dynamic> typeItem;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedElevation: 0,
        closedColor: Colors.transparent,
        closedBuilder: (context, openWidget) {
          return InkWell(
              onTap: openWidget, child: CarouselItem(item: typeItem));
        },
        openBuilder: (context, closeWidget) {
          return TransportTypeDetails(details: typeItem);
        });
  }
}

class CarouselItem extends StatelessWidget {
  const CarouselItem({Key? key, required this.item}) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(
        left: 20,
        top: 5,
      ),
      decoration: BoxDecoration(
        // color: Get.theme.brightness == Brightness.light
        //     ? smDarkColor
        //     : smPrimaryColor,
        color: smPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 250,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                // color: Get.theme.brightness == Brightness.light
                //     ? smPrimaryColor
                //     : smDarkColor,
                boxShadow: [
                  BoxShadow(
                      color: smDarkColor.withOpacity(0.8),
                      spreadRadius: 0.5,
                      blurRadius: 25,
                      offset: const Offset(0, 15))
                ],
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  colorFilter: Get.theme.brightness == Brightness.light
                      ? const ColorFilter.mode(
                          Colors.transparent, BlendMode.color)
                      : ColorFilter.mode(
                          Colors.blueGrey.shade900.withOpacity(0.6),
                          BlendMode.saturation),
                  fit: BoxFit.cover,
                  image: AssetImage(item['image']),
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              item['type'],
              style: Get.textTheme.headlineSmall?.copyWith(
                  color: Get.theme.brightness == Brightness.light
                      ? smWhiteColor
                      : smBlueLightest),
            ),
            const SizedBox(height: 5),
            Text(
              item['capacity'],
              style: Get.textTheme.titleMedium?.copyWith(
                  color: Get.theme.brightness == Brightness.light
                      ? smBlueLighter
                      : smSecondaryColor),
            ),
          ]),
    );
  }
}
