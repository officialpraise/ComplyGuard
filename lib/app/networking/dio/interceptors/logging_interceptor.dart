import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"Content-Type": "application/json"});
    debugPrint(
        "📤 REQUEST: ${options.method} ${options.uri} ${options.headers}  ${options.data}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        "✅ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        "❌ ERROR: ${err.response?.statusCode} ${err.requestOptions.uri}");
    handler.next(err);
  }
}
