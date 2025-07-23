import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/grid_model.dart';
import 'package:technical_round/utils/image.dart';

class GridController extends GetxController {
  TextEditingController commentController = TextEditingController();
  final gridItems = <GridItem>[
    GridItem(imagePath: Images.cakeImage, title: "Birthday & Aniv"),
    GridItem(imagePath: Images.invoiceImage, title: "Invoice & Billing"),
    GridItem(imagePath: Images.eventImage, title: "Event Manager"),
    GridItem(imagePath: Images.bankImage, title: "Bank & Finance"),
    GridItem(imagePath: Images.aiImage, title: "AI Voice"),
    GridItem(imagePath: Images.recentImage, title: "Recent Use"),
  ].obs;
}
