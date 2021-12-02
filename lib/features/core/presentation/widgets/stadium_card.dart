import 'package:flutter/material.dart';

class StadiumCard extends StatelessWidget {
  final double height;
  final double width;

  const StadiumCard({
    Key? key,
    this.height = 42.0,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        height: height,
        width: width,
        child: const Card(
          color: Colors.white,
          shape: StadiumBorder(),
          elevation: 4.0,
        ),
      ),
    );
  }
}
