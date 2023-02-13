import 'package:apple_shop/data/model/product_image.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dio/dio.dart';

import '../../util/api_exception.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImage>> getGallery();
}

class DetailProductRemoteDatasource extends IDetailProductDatasource {
  final Dio _dio = locator.get();


  @override
  Future<List<ProductImage>> getGallery() async {
        try {
            Map<String, String> qParams = {'filter': 'product_id="0tc0e5ju89x5ogj"'};
      var respones = await _dio.get('collections/gallery/records',queryParameters: qParams);
      
      return respones.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
