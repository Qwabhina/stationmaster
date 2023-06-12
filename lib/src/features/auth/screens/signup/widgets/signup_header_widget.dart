import 'package:flutter/material.dart';
import 'package:stationmaster/src/constants/image_strings.dart';
import 'package:stationmaster/src/constants/text_strings.dart';

class SignupHeaderWidget extends StatelessWidget {
  const SignupHeaderWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.01),
        Image(
          image: const AssetImage(smSignUpIcon),
          height: size.height * 0.20,
        ),
        SizedBox(height: size.height * 0.025),
        Text(
          smSignUpTitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          smSignUpSubTitle,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.015),
      ],
    );
  }
}
