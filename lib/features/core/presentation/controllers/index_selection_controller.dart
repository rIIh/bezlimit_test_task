import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class IndexSelectionController extends GetxController {
  final TextEditingController textController;
  final FocusNode focusNode = FocusNode();
  final RxInt nextSelected;

  IndexSelectionController(int selected)
      : nextSelected = selected.obs,
        textController = TextEditingController(text: selected.toString());

  @override
  void onInit() {
    textController.addListener(() {
      final result = int.tryParse(textController.text);
      if (result != null) {
        nextSelected.value = result;
      }
    });

    focusNode.addListener(() {
      if (!focusNode.hasPrimaryFocus) {
        textController.text = nextSelected.string;
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
