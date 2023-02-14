import 'package:apple_shop/data/model/product_image.dart';
import 'package:dartz/dartz.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> getProductImages;
  ProductDetailResponseState(this.getProductImages);
}
