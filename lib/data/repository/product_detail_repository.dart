import 'package:apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/data/model/product_image.dart';
import 'package:dartz/dartz.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class IDetailProductRepository {
  Future<Either<String, List<ProductImage>>> getProuctImage();
}

class DetailProductRepository extends IDetailProductRepository {
  @override
  Future<Either<String, List<ProductImage>>> getProuctImage() async {
    final IDetailProductDatasource _datasource = locator.get();
    try {
      var response = await _datasource.getGallery();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
