import 'package:apple_shop/bloc/authentication/auth_bloc.dart';
import 'package:apple_shop/bloc/authentication/auth_state.dart';
import 'package:apple_shop/main.dart';
import 'package:apple_shop/screens/dashbord_screen.dart';
import 'package:apple_shop/screens/login_screen.dart';
import 'package:apple_shop/util/auth_manager.dart';
import 'package:apple_shop/widgets/category_icon_item_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 44, bottom: 32),
              child: Container(
                height: 46,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset('assets/images/icon_apple_blue.png'),
                    const Expanded(
                      child: Text(
                        'حساب کاربری',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'sb',
                            fontSize: 16,
                            color: CustomColors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Text(
              'امیراحمدادیبی',
              style: TextStyle(fontFamily: 'sb', fontSize: 16),
            ),
            const Text(
              '09909804320',
              style: TextStyle(fontFamily: 'sm', fontSize: 10),
            ),
            SizedBox(
              height: 30,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: const [
                  //   CategoryItemChip(),
                  //   CategoryItemChip(),
                  //   CategoryItemChip(),
                  //   CategoryItemChip(),
                  //   CategoryItemChip(),
                  //   CategoryItemChip(),
                  //   CategoryItemChip(),
                  //   CategoryItemChip(),
                  //   CategoryItemChip(),
                  //   CategoryItemChip(),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                AuthManager.logout();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Text(
                'خروج از حساب کاربری',
                style: TextStyle(fontFamily: 'dana', color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'اپل شاپ',
              style: TextStyle(
                  fontFamily: 'sm', fontSize: 10, color: CustomColors.gery),
            ),
            const Text('v-1.0.00',
                style: TextStyle(
                    fontFamily: 'sm', fontSize: 10, color: CustomColors.gery)),
            const Text('Instagram.com/Mojava-dev',
                style: TextStyle(
                    fontFamily: 'sm', fontSize: 10, color: CustomColors.gery))
          ],
        ),
      ),
    );
  }
}
