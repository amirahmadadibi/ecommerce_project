import 'package:dio/dio.dart';

class DioProvider {
  Dio createDio() {
    Dio dio = Dio(
        BaseOptions(baseUrl: 'http://startflutter.ir/api/',
        headers: {
            'Content-Type':'application/json',
            'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJleHAiOjE2OTY0NDM2MjIsImlkIjoicTVseWt5Y3g2MXF6ZGFnIiwidHlwZSI6ImF1dGhSZWNvcmQifQ.QNliAFWKplJoYO9-QhoPl861cs6kvgvhM4bj6d438Ss'
        })
    );

    return dio;
  }
}
