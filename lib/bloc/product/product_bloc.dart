import 'package:apple_shop/bloc/product/product_event.dart';
import 'package:apple_shop/bloc/product/product_state.dart';
import 'package:apple_shop/data/repository/basket_repository.dart';
import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:bloc/bloc.dart';

import '../../data/model/card_item.dart';
import '../../di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IDetailProductRepository _productRepository = locator.get();
  final IBasketRepository _basketRepository = locator.get();
  ProductBloc() : super(ProductInitState()) {
    on<ProductInitializeEvent>((event, emit) async {
      emit(ProductDetailLoadingState());

      var productImages =
          await _productRepository.getProuctImage(event.productId);

      var productVariant =
          await _productRepository.getProductVarinats(event.productId);
      var productCategory =
          await _productRepository.getProductCategory(event.categoryId);
      var productProperties =
          await _productRepository.getProductProperties(event.productId);
      emit(ProductDetailResponseState(
          productImages, productVariant, productCategory, productProperties));
    });

    on<ProductAddToBasket>(((event, emit) {
      var basketItem = BasketItem(
          event.product.id,
          event.product.collectionId,
          event.product.thumbnail,
          event.product.discountPrice,
          event.product.price,
          event.product.name,
          event.product.categoryId);

      _basketRepository.addProductToBasket(basketItem);
    }));
  }
}
