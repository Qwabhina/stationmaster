import 'package:flutter/material.dart';
import 'package:stationmaster/src/utils/json/transport_types_data.dart';
import 'package:stationmaster/src/features/auth/screens/dashboard/widgets/transport_types/transport_types_widget.dart';

class TransportTypesListWidget extends StatelessWidget {
  const TransportTypesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: transportTypesData
            .map(
              (t) => TransportTypeWidget(typeItem: t),
            )
            .toList(),
      ),
    );
  }
}
