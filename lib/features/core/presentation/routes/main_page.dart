import 'dart:math';

import 'package:bezlimit_test_task/features/core/presentation/controllers/home_controller.dart';
import 'package:bezlimit_test_task/features/core/presentation/widgets/cards_list.dart';
import 'package:bezlimit_test_task/features/core/presentation/widgets/stadium_card.dart';
import 'package:bezlimit_test_task/utilities/list_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainPageRoute extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  MainPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -100,
            top: -100,
            child: GetX<HomeController>(
              builder: (controller) {
                return Transform.rotate(
                  angle: -controller.progress.value * pi,
                  child: RepaintBoundary(
                    child: SvgPicture.asset(
                      'assets/images/circle.svg',
                      width: 250,
                      height: 250,
                    ),
                  ),
                );
              },
            ),
          ),
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Colors.transparent,
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...intersperse(
                                const SizedBox(height: 12.0),
                                [
                                  StadiumCard(width: Get.width * .70),
                                  StadiumCard(width: Get.width * .85),
                                  StadiumCard(width: Get.width * .55),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32.0),
                        CardsList(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
