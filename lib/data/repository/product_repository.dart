import 'package:apple_shop/data/datasource/product_data_source.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:dartz/dartz.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';


abstract class IProductRepository {
  Future<Either<String, List<Product>>> getproducts();
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
}
