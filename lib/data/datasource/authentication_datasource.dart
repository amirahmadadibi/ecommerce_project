import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthenticationRemote {
  final Dio _dio = locator.get();

  Future<void> register(
      String username, String password, String passwordConfirm) async {
    try {
      final response = await _dio.post('collections/users/records', data: {
        'username': username,
        'password': password,
        'passwordConfirm': passwordConfirm
      });
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {}
  }
}
