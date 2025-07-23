import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/api_screen.dart';
import 'package:technical_round/grid_controller.dart';
import 'package:technical_round/utils/colors.dart';
import 'package:technical_round/utils/image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GridController());
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: const Text(
            "ORGANIZER",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: AppColors.secondaryColor),
          ),
          actions: [
            Image.asset(Images.notificationIcon, height: 40, width: 40),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: AppColors.secondaryColor,
              child: Image.asset(Images.personIcon, height: 40, width: 40),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoText("Let's plan your day efficiently."),
                      const SizedBox(height: 15),
                      taskDetailContainer(),
                      const SizedBox(height: 40),
                      moreFeatureRow(),
                      const SizedBox(height: 20),
                      featureGridView(controller),
                      const SizedBox(height: 30),
                      infoText("Suggest your feedback"),
                      const SizedBox(height: 20),
                      Image.asset(Images.emojiImage),
                      const SizedBox(height: 20),
                      customTextField(controller),
                      const SizedBox(height: 20),
                      GestureDetector(
                          onTap: () => Get.to(const ApiScreen()),
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: AppColors.gradient,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text("Submit Feedback",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)))))
                    ]))));
  }

  TextField customTextField(GridController controller) {
    return TextField(
        controller: controller.commentController,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: "Leave a comment",
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[400]!)),
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!))));
  }

  Widget featureGridView(GridController controller) {
    return Obx(() {
      return GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(controller.gridItems.length, (index) {
            final item = controller.gridItems[index];
            return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item.imagePath,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 10),
                          Text(item.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400))
                        ])));
          }));
    });
  }

  Row moreFeatureRow() {
    return Row(children: [
      infoText("More Features"),
      const Spacer(),
      Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.blueColor, width: 1.5),
              borderRadius: BorderRadius.circular(5)),
          child: const Icon(Icons.more_vert, color: AppColors.blueColor))
    ]);
  }

  Container taskDetailContainer() {
    return Container(
        decoration: BoxDecoration(
            gradient: AppColors.gradient,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Date Row:
              Row(children: [
                // calender icon
                Image.asset(Images.calendarIcon, height: 25, width: 25),
                const Text("01 July 2025 6:00 PM",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700)),
                const Spacer(),
                const Icon(Icons.more_horiz, color: Colors.white, size: 30)
              ]),
              // const SizedBox(height: 10)
              const Text("Today's Summary",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 10),
              Row(children: [
                Flexible(
                    flex: 8,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10),
                        value: 0.9,
                        backgroundColor: AppColors.darkTeal.withOpacity(0.35),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 16)),
                const SizedBox(width: 10),
                const Text("90%",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 10),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                      child: Text("View More",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400))))
            ])));
  }

  Text infoText(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.darkTeal),
    );
  }
}
