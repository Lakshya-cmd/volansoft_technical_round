import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:technical_round/user_model.dart';


class UserController extends GetxController {
  final TextEditingController idController = TextEditingController();

  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  Future<void> fetchUserById() async {
    final idText = idController.text.trim();

    if (idText.isEmpty || int.tryParse(idText) == null) {
      Get.snackbar("Invalid ID", "Please enter a valid integer ID.");
      return;
    }

    isLoading.value = true;
    final url = Uri.parse('https://dummyjson.com/users/$idText');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        user.value = UserModel.fromJson(data);
      } else {
        user.value = null;
        Get.snackbar("Error", "User not found");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
