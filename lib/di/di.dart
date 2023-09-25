import 'package:apple_shop/bloc/basket/basket_bloc.dart';
import 'package:apple_shop/data/datasource/authentication_datasource.dart';
import 'package:apple_shop/data/datasource/banner_datasource.dart';
import 'package:apple_shop/data/datasource/basket_datasource.dart';
import 'package:apple_shop/data/datasource/category_datasource.dart';
import 'package:apple_shop/data/datasource/category_product_datasource.dart';
import 'package:apple_shop/data/datasource/comment_datasource.dart';
import 'package:apple_shop/data/datasource/product_data_source.dart';
import 'package:apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/data/repository/banner_repository.dart';
import 'package:apple_shop/data/repository/basket_repository.dart';
import 'package:apple_shop/data/repository/category_product_repository.dart';
import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:apple_shop/data/repository/comment_repository.dart';
import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:apple_shop/data/repository/product_repository.dart';
import 'package:apple_shop/util/dio_provider.dart';
import 'package:apple_shop/util/pyament_handler.dart';
import 'package:apple_shop/util/url_handler.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  await _initComponents();

  _initDatasoruces();

  _initRepositories();

  locator
      .registerSingleton<BasketBloc>(BasketBloc(locator.get(), locator.get()));
}

Future<void> _initComponents() async {
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  locator.registerSingleton<UrlHandler>(UrlLauncher());
  locator
      .registerSingleton<PaymentHandler>(ZarinpalPaymentHandler(locator.get()));
  locator.registerSingleton<Dio>(DioProvider.createDio());
}

void _initDatasoruces() {
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());
  locator
      .registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());
  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());
  locator.registerFactory<IProductDataSource>(() => ProductRemoteDataSource());
  locator.registerFactory<IDetailProductDatasource>(
      () => DetailProductRemoteDatasource());
  locator.registerFactory<ICategoryProductDatasource>(
      () => CategoryProductRemoteDatasource());
  locator.registerFactory<IBasketDatasource>(() => BasketLocalDatasouce());

  locator.registerFactory<ICommentDatasource>(() => CommentRemoteDatasource());
}

void _initRepositories() {
  locator.registerFactory<IAuthRepository>(() => AuthencticationRepository());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<IProductRepository>(() => ProductRepository());
  locator.registerFactory<IDetailProductRepository>(
      () => DetailProductRepository());
  locator.registerFactory<ICategoryProductRepository>(
      () => CategoryProductRepository());
  locator.registerFactory<IBasketRepository>(() => BasketRepository());

  locator.registerFactory<ICommentRepository>(() => CommentRepository());
}
