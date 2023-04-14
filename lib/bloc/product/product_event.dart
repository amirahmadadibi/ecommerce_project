import 'package:apple_shop/data/model/product.dart';

abstract class ProductEvent {}

class ProductInitializeEvent extends ProductEvent {
  String productId;
  String categoryId;
  ProductInitializeEvent(this.productId, this.categoryId);
}

class ProductAddToBasket extends ProductEvent {
  Product product;
  ProductAddToBasket(this.product);
}
