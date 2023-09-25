import 'dart:ui';
import 'package:apple_shop/bloc/basket/baset_event.dart';
import 'package:apple_shop/bloc/basket/basket_bloc.dart';
import 'package:apple_shop/bloc/category/category_bloc.dart';
import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:apple_shop/screens/card_screen.dart';
import 'package:apple_shop/screens/category_screen.dart';
import 'package:apple_shop/screens/home_screen.dart';
import 'package:apple_shop/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_event.dart';
import '../di/di.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedBottomNavigationIndex = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: selectedBottomNavigationIndex,
          children: getScreens(),
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
      BlocProvider(
        create: ((context) {
          var bloc = locator.get<BasketBloc>();
          bloc.add(BasketFetchFromHiveEvent());
          return bloc;
        }),
        child: CardScreen(),
      ),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: CategoryScreen(),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
          create: (context) {
            var bloc = HomeBloc();
            bloc.add(HomeGetInitilzeData());
            return bloc;
          },
          child: HomeScreen(),
        ),
      )
    ];
  }
}
