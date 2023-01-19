import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/data/datasource/category_datasource.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  //componenets
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/')));

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  //datasources
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());
  locator
      .registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());
  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthencticationRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
}
