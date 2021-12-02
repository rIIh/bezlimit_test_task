import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final progress = 0.0.obs;

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.hasClients == false) return;

      final scrollPosition = scrollController.position;
      progress.value = scrollPosition.pixels / scrollPosition.maxScrollExtent;

      if (scrollPosition.pixels == scrollPosition.maxScrollExtent) {
        Get.snackbar('scroll', 'end', snackPosition: SnackPosition.BOTTOM);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
