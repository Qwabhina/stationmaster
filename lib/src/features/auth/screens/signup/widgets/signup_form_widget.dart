import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/sizes.dart';
import 'package:stationmaster/src/features/auth/controllers/signup_controller.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    Key? key,
  }) : super(key: key);

  // Sign UP Controller

  @override
  Widget build(BuildContext context) {
    final ctrl = SignUpController();

    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name Field
          TextFormField(
            controller: ctrl.fnText,
            decoration: const InputDecoration(
              prefixIcon: Icon(Ionicons.person_outline),
              labelText: "Full Name",
              hintText: "Enter your Full Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: smDefaultSize / 2,
          ),

          // Email Field
          TextFormField(
            controller: ctrl.emText,
            decoration: const InputDecoration(
              prefixIcon: Icon(Ionicons.mail_outline),
              labelText: "Email",
              hintText: "Enter your Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: smDefaultSize / 2,
          ),

          // Phone Number Field
          TextFormField(
            controller: ctrl.pnText,
            decoration: const InputDecoration(
              prefixIcon: Icon(Ionicons.call_outline),
              labelText: "Phone Number",
              hintText: "Enter your Phone Number",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: smDefaultSize / 2,
          ),

          // Password Field
          Obx(
            () => TextFormField(
              controller: ctrl.pwText,
              decoration: InputDecoration(
                prefixIcon: const Icon(Ionicons.lock_closed_outline),
                labelText: "Password",
                hintText: "Enter your Password",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    ctrl.isObscure.value = !ctrl.isObscure.value;
                  },
                  icon: ctrl.isObscure.value == false
                      ? const Icon(Ionicons.eye)
                      : const Icon(Ionicons.eye_off),
                ),
              ),
              obscureText: ctrl.isObscure.value,
            ),
          ),
          const SizedBox(
            height: smDefaultSize / 2,
          ),

          //Form Submit Button
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => ctrl.processSignUp(ctrl.fnText.text,
                    ctrl.emText.text, ctrl.pnText.text, ctrl.pwText.text),
                child: ctrl.isLoading.value == false
                    ? Text("Sign Up".toUpperCase())
                    : CircularProgressIndicator(
                        color: Get.theme.brightness == Brightness.light
                            ? smWhiteColor
                            : smDarkColor,
                      ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
