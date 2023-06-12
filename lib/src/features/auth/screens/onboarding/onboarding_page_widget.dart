import 'package:flutter/material.dart';
import 'package:stationmaster/src/features/auth/models/onboarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.ob,
  }) : super(key: key);

  final OnBoardingModel ob;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(ob.image),
        fit: BoxFit.cover,
      )),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            ob.gColor1.withOpacity(0.65),
            ob.gColor2.withOpacity(0.95),
          ],
          // stops: const [0.0, 1],
          begin: Alignment.topLeft,
        )),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: size.height * 0.5,
            width: size.width * 0.8,
            margin: EdgeInsets.only(top: size.height * 0.2),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ob.title,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: ob.titleColor),
                ),
                const SizedBox(height: 15.0),
                Text(
                  ob.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: ob.subTitleColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
