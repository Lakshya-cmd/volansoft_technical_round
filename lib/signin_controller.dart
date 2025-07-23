import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:technical_round/home_screen.dart';
import 'package:technical_round/login_screen.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }

  final storage = const FlutterSecureStorage();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!GetUtils.isEmail(value)) return "Enter a valid email";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    return null;
  }

  String? validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) return "Repeat password is required";
    if (value != passwordController.text) return "Passwords do not match";
    return null;
  }

  Future<void> signIn() async {
    if (formKey.currentState?.validate() ?? false) {
      storage.write(key: "email", value: emailController.text);
      storage.write(key: "password", value: passwordController.text);
      Get.snackbar("Success", "SignIn successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
      // onClose();
      await Future.delayed(const Duration(seconds: 2));
      Get.to(const LoginScreen());
    } else {
      Get.snackbar("Error", "Please fill the required fields",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> logIn() async {
    if (formKey.currentState?.validate() ?? false) {
      final storedEmail = await storage.read(key: "email");
      final storedPassword = await storage.read(key: "password");
      if (formKey.currentState?.validate() ?? false) {
        if (storedEmail == emailController.text &&
            storedPassword == passwordController.text) {
          Get.snackbar("Success", "Login successful",
              backgroundColor: Colors.green, colorText: Colors.white);
          await Future.delayed(const Duration(seconds: 2));
          Get.to(const HomeScreen());
        } else {
          Get.snackbar("Error", "Invalid credentials",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      }
    }
  }
}
