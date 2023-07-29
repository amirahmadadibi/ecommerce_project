import 'package:apple_shop/data/model/comment.dart';
import 'package:dio/dio.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class ICommentDatasource {
  Future<List<Comment>> getComments(String productId);
}

class CommentRemoteDatasource extends ICommentDatasource {
  @override
  Future<List<Comment>> getComments(String productId) async {
    final Dio _dio = locator.get();
    Map<String, String> qParams = {'filter': 'product_id="$productId"'};

    try {
      var respones = await _dio.get('collections/comment/records',
          queryParameters: qParams);
      return respones.data['items']
          .map<Comment>((jsonObject) => Comment.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
