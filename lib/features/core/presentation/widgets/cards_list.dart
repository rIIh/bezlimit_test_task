import 'package:bezlimit_test_task/features/core/presentation/controllers/card_list_controller.dart';
import 'package:bezlimit_test_task/features/core/presentation/routes/index_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

const kCardSize = 82.0;

class CardsList extends StatelessWidget {
  final double cardSize;
  final EdgeInsets padding;

  final CardListController controller = Get.put(CardListController());

  CardsList({
    Key? key,
    this.cardSize = kCardSize,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardSize,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        controller: controller.scrollController,
        itemCount: controller.length.value,
        itemBuilder: (context, index) => _IndexedCard(
          index: index,
          size: cardSize,
        ),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 12.0),
      ),
    );
  }
}

class _IndexedCard extends GetWidget<CardListController> {
  final int index;
  final double size;

  const _IndexedCard({
    Key? key,
    required this.index,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final nextSelected = await Get.to<int?>(
          () => IndexSelectionPageRoute(
            initialIndex: index,
          ),
        );

        if (nextSelected != null) {
          controller.select(nextSelected);
        }
      },
      child: GetX<CardListController>(
        builder: (controller) => Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12.0),
            color: controller.selected.value == index
                ? Colors.green
                : Colors.white,
          ),
          child: Center(child: Text(index.toString())),
        ),
      ),
    );
  }
}
