import 'package:apple_shop/bloc/authentication/auth_bloc.dart';
import 'package:apple_shop/data/model/card_item.dart';
import 'package:apple_shop/screens/dashbord_screen.dart';
import 'package:apple_shop/screens/login_screen.dart';
import 'package:apple_shop/util/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'di/di.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BasketItemAdapter());
  await Hive.openBox<BasketItem>('CardBox');

  await getItInit();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigationIndex = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: globalNavigatorKey,
      home: (AuthManager.readAuth().isEmpty)
          ?  LoginScreen()
          : DashBoardScreen(),
    );
  }
}
