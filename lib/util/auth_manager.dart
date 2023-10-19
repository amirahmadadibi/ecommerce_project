import 'package:apple_shop/di/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);
  static final SharedPreferences _sharedPref = locator.get();

  static void saveToken(String token) async {
    _sharedPref.setString('access_token', token);
    authChangeNotifire.value = token;
  }

  static void saveId(String id) async {
    _sharedPref.setString('user_id', id);
  }

  static String getId() {
    return _sharedPref.getString('user_id') ?? '';
  }

  static String readAuth() {
    return _sharedPref.getString('access_token') ?? '';
  }

  static void logout() {
    _sharedPref.clear();
    authChangeNotifire.value = null;
  }

  static bool isLogedin() {
    String token = readAuth();
    return token.isNotEmpty;
  }
}
