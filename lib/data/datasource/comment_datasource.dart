import 'package:apple_shop/data/model/comment.dart';
import 'package:dio/dio.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class ICommentDatasource {
  Future<List<Comment>> getComments(String productId);
  Future<void> postComment(String productId, String comment);
}

class CommentRemoteDatasource extends ICommentDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Comment>> getComments(String productId) async {
    Map<String, String> qParams = {
      'filter': 'product_id="$productId"',
      'expand': 'user_id'
    };

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

  @override
  Future<void> postComment(String productId, String comment) async {
    try {
      final response = await _dio.post('collections/comment/records', data: {
        'text': comment,
        'user_id': 'lkg8xc50i07oedn',
        'product_id': productId
      });
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
