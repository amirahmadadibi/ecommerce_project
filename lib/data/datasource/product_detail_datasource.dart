import 'package:apple_shop/data/model/product_image.dart';
import 'package:apple_shop/data/model/product_variant.dart';
import 'package:apple_shop/data/model/variant.dart';
import 'package:apple_shop/data/model/variant_type.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dio/dio.dart';

import '../../util/api_exception.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImage>> getGallery();
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant();
  Future<List<ProductVarint>> getProductVariants();
}

class DetailProductRemoteDatasource extends IDetailProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImage>> getGallery() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="0tc0e5ju89x5ogj"'};
      var respones = await _dio.get('collections/gallery/records',
          queryParameters: qParams);

      return respones.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      var respones = await _dio.get('collections/variants_type/records');

      return respones.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromjson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<Variant>> getVariant() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="0tc0e5ju89x5ogj"'};

      var respones = await _dio.get('collections/variants/records',
          queryParameters: qParams);

      return respones.data['items']
          .map<Variant>((jsonObject) => Variant.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<ProductVarint>> getProductVariants() async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariant();

    List<ProductVarint> productVariantList = [];

    for (var variantType in variantTypeList) {
      var variant = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();
      productVariantList.add(ProductVarint(variantType, variant));
    }

    return productVariantList;
  }
}
