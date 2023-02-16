import 'package:apple_shop/data/model/product_image.dart';
import 'package:apple_shop/data/model/variant_type.dart';
import 'package:dartz/dartz.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImages;
  Either<String, List<VariantType>> productVariantTypes;

  ProductDetailResponseState(this.productImages, this.productVariantTypes);
}
