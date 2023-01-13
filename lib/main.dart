import 'dart:ui';

import 'package:apple_shop/bloc/authentication/auth_bloc.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/screens/card_screen.dart';
import 'package:apple_shop/screens/category_screen.dart';
import 'package:apple_shop/screens/home_screen.dart';
import 'package:apple_shop/screens/login_screen.dart';
import 'package:apple_shop/screens/product_detail_screen.dart';
import 'package:apple_shop/screens/product_list_screen.dart';
import 'package:apple_shop/screens/profile_screen.dart';
import 'package:apple_shop/util/auth_manager.dart';
import 'package:apple_shop/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/authentication_datasource.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
            create: ((context) => AuthBloc()),
            child: LoginScreen(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigationIndex = index;
                });
              },
              currentIndex: selectedBottomNavigationIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedLabelStyle: const TextStyle(
                  fontFamily: 'sb', fontSize: 10, color: CustomColors.blue),
              unselectedLabelStyle: const TextStyle(
                  fontFamily: 'sb', fontSize: 10, color: Colors.black),
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_profile.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child: Image.asset(
                            'assets/images/icon_profile_active.png'),
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: CustomColors.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13))
                        ]),
                      ),
                    ),
                    label: 'حساب کاربری'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_basket.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child:
                            Image.asset('assets/images/icon_basket_active.png'),
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: CustomColors.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13))
                        ]),
                      ),
                    ),
                    label: 'سبد خرید'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_category.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child: Image.asset(
                            'assets/images/icon_category_active.png'),
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: CustomColors.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13))
                        ]),
                      ),
                    ),
                    label: 'دسته بندی'),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon_home.png'),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child:
                            Image.asset('assets/images/icon_home_active.png'),
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: CustomColors.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13))
                        ]),
                      ),
                    ),
                    label: 'خانه'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return <Widget>[
      ProfileScreen(),
      CardScreen(),
      ProductListScreen(),
      HomeScreen()
    ];
  }
}
