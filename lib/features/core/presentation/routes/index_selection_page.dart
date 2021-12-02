import 'package:bezlimit_test_task/features/core/presentation/controllers/card_list_controller.dart';
import 'package:bezlimit_test_task/features/core/presentation/controllers/index_selection_controller.dart';
import 'package:bezlimit_test_task/features/core/presentation/formatters/numerical_formatters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexSelectionPageRoute extends StatelessWidget {
  final int initialIndex;
  late final IndexSelectionController controller =
      Get.put(IndexSelectionController(initialIndex));

  IndexSelectionPageRoute({Key? key, required this.initialIndex})
      : super(key: key);

  VoidCallback? getSaveCallback() {
    if (Get.find<CardListController>()
        .canSelect(controller.nextSelected.value)) {
      return () => Get.back(result: controller.nextSelected.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() {
                return TextField(
                  autofocus: true,
                  controller: controller.textController,
                  focusNode: controller.focusNode,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  inputFormatters: [
                    NumericalRangeFormatter(
                      min: 0,
                      max: Get.find<CardListController>().length.value - 1,
                    ),
                  ],
                );
              }),
              const Spacer(),
              Obx(() => ElevatedButton(
                    onPressed: getSaveCallback(),
                    child: const Text("Save"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
