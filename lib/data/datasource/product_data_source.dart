import 'package:apple_shop/data/model/product.dart';
import 'package:dio/dio.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class IProductDataSource {
  Future<List<Product>> getProducts();
}


class ProductRemoteDataSource extends IProductDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<Product>> getProducts() async {
     try {
      var respones = await _dio.get('collections/products/records');
      return respones.data['items']
          .map<Product>((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

}