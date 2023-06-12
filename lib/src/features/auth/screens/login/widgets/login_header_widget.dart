import 'package:flutter/material.dart';
import 'package:stationmaster/src/constants/image_strings.dart';
import 'package:stationmaster/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: size.height * 0.05),
        Image(
          image: const AssetImage(smLoginIcon),
          height: size.height * 0.20,
        ),
        SizedBox(height: size.height * 0.075),
        Text(
          smLoginTitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          smLoginSubTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: size.height * 0.015),
      ],
    );
  }
}
