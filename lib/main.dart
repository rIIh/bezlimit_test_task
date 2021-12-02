import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';

import 'features/core/presentation/routes/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugRepaintRainbowEnabled = true;
    return GetMaterialApp(
      title: 'Bezlimit Test Task',
      home: MainPageRoute(),
    );
  }
}
