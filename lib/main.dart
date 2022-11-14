import 'dart:ui';

import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/screens/category_screen.dart';
import 'package:apple_shop/screens/home_screen.dart';
import 'package:apple_shop/screens/product_list_screen.dart';
import 'package:apple_shop/widgets/banner_slider.dart';
import 'package:apple_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ProductListScreen(),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      child: Image.asset('assets/images/icon_home.png'),
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: CustomColors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13))
                      ]),
                    ),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_home.png'),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_home.png'),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_home.png'),
                    label: 'home'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
