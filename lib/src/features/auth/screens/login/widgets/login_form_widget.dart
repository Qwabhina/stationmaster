import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/sizes.dart';
import 'package:stationmaster/src/features/auth/controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController lgCtrl = LoginController();
    return Form(
        // key: _formKey,
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: lgCtrl.userIdText,
            decoration: const InputDecoration(
              prefixIcon: Icon(Ionicons.person_outline),
              labelText: "Email or Phone Number",
              hintText: "Enter your Email or Phone Number",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: smDefaultSize / 2,
          ),
          Obx(
            () => TextFormField(
              controller: lgCtrl.userPassText,
              decoration: InputDecoration(
                prefixIcon: const Icon(Ionicons.lock_closed_outline),
                labelText: "Password",
                hintText: "Enter your Password",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    lgCtrl.isObscure.value = !lgCtrl.isObscure.value;
                  },
                  icon: lgCtrl.isObscure.value == false
                      ? const Icon(Ionicons.eye)
                      : const Icon(Ionicons.eye_off),
                ),
              ),
              obscureText: lgCtrl.isObscure.value,
            ),
          ),
          const SizedBox(
            height: smDefaultSize / 2,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text("Forgot Password?"),
            ),
          ),
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => lgCtrl.processLogin(
                    lgCtrl.userIdText.text, lgCtrl.userPassText.text),
                child: lgCtrl.isLoading.value == false
                    ? Text("Login".toUpperCase())
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
