import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/widgets/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: ShapeDecoration(
                      color: Colors.red,
                      shadows: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 40,
                          spreadRadius: -6,
                          offset: Offset(0.0, 15),
                        )
                      ],
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                Icon(
                  Icons.mouse,
                  color: Colors.white,
                  size: 32,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('test')
          ],
        )),
      ),
    );
  }
}
