import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('📨 📨 📨 Request 📨 📨 📨');
    debugPrint('[${options.method}]: ${options.uri}');
    debugPrint('Header: ${options.headers}');
    debugPrint('Data: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('✅ ✅ ✅ Response ✅ ✅ ✅');
    debugPrint('[${response.statusCode}]: ${response.requestOptions.uri}');
    debugPrint('Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('😓 😓 😓 DioException 😓 😓 😓');
    debugPrint(
        '[${err.response?.statusCode}]: ${err.response?.requestOptions.uri}');
    debugPrint('${err.response?.data}');
    debugPrint('$err');
    handler.next(err);
  }
}
