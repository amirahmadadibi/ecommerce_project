import 'package:apple_shop/data/datasource/product_data_source.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:dartz/dartz.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getproducts();
  Future<Either<String, List<Product>>> getHotest();
  Future<Either<String, List<Product>>> getBsetSeller();
}

class ProductRepository extends IProductRepository {
  final IProductDataSource _datasource = locator.get();
  @override
  Future<Either<String, List<Product>>> getproducts() async {
    try {
      var response = await _datasource.getProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Product>>> getBsetSeller() async {
    try {
      var response = await _datasource.getBestSeller();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Product>>> getHotest() async {
    try {
      var response = await _datasource.getHotest();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
