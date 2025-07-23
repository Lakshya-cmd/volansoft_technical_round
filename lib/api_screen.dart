import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/user_controller.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch User Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controller.idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter User ID",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: controller.fetchUserById,
                child: const Text("Fetch"),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator();
                } else if (controller.user.value == null) {
                  return const Text("No user data available.");
                } else {
                  final user = controller.user.value!;
                  return Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(user.image ?? ""),
                            radius: 40,
                          ),
                          const SizedBox(height: 12),
                          Text("${user.firstName} ${user.lastName}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(user.email ?? ""),
                          const Divider(),
                          Text("Age: ${user.age}"),
                          Text("Gender: ${user.gender}"),
                          Text("Phone: ${user.phone}"),
                          Text("Blood Group: ${user.bloodGroup}"),
                          Text("University: ${user.university}"),
                          const Divider(),
                          Text("Company: ${user.company?.name ?? '-'}"),
                          Text("Title: ${user.company?.title ?? '-'}"),
                          Text(
                              "Bank: ${user.bank?.cardType} - ${user.bank?.cardNumber}"),
                          const Divider(),
                          Text("Crypto Coin: ${user.crypto?.coin}"),
                          Text("Wallet: ${user.crypto?.wallet}"),
                        ],
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
