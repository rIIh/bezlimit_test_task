import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

const double kScrollAnimationSpeed = 1.0;

class CardListController extends GetxController {
  var scrollController = ScrollController();
  var selected = Rx<int?>(null);
  var length = 100.obs;

  bool canSelect(int index) => index >= 0 && index < length.value;

  void select(int index, {bool initiateScrolling = true}) {
    if (canSelect(index) == false) throw StateError("Index is out of bounds");
    selected.value = index;

    if (initiateScrolling) {
      scrollToSelected();
    }
  }

  bool trySelect(int index) {
    try {
      select(index);
      return true;
    } on StateError {
      return false;
    }
  }

  void scrollToSelected() {
    if (selected.value != null && scrollController.hasClients) {
      final offset = selected.value! /
          length.value *
          scrollController.position.maxScrollExtent;
      final duration = (scrollController.position.pixels - offset).abs() /
          5 *
          kScrollAnimationSpeed;

      scrollController.animateTo(
        offset,
        duration: Duration(milliseconds: duration.toInt()),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
