import 'package:apple_shop/data/datasource/basket_datasource.dart';
import 'package:apple_shop/data/model/card_item.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class IBasketRepository {
  Future<Either<String, String>> addProductToBasket(BasketItem basketItem);
}

class BasketRepository extends IBasketRepository {
  final IBasketDatasource datasource = locator.get();

  @override
  Future<Either<String, String>> addProductToBasket(
      BasketItem basketItem) async {
    try {
      datasource.addProduct(basketItem);
      return right('محصول به سبد خرید اضافه شد');
    } catch (ex) {
      return left('خطا در افزودن محصول به سبد خرید');
    }
  }
}
