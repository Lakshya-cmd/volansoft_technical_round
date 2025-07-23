import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/signin_controller.dart';
import 'package:technical_round/utils/colors.dart';
import 'package:technical_round/utils/image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SigninController controller = Get.put(SigninController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.signInImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Start reading your favourite books today!",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 30),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.emailController,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            ),
                            validator: controller.validateEmail,
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: controller.passwordController,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: controller.validatePassword,
                          ),
                          const SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: controller.logIn,
                            child: const Text("Login In"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
