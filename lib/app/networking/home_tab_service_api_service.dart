import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../config/keys.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

import 'dio/interceptors/logging_interceptor.dart';

class HomeTabServiceApiService extends NyApiService {
  HomeTabServiceApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);
  @override
  get interceptors => {
        if (getEnv('APP_DEBUG') == true) PrettyDioLogger: PrettyDioLogger(),
        LoggingInterceptor: LoggingInterceptor(),
      };
  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<dynamic> fecthEscalation() async {
    String userToken = Backpack.instance.read(Keys.bearerToken);
    return await network(
      request: (request) => request.get("/api/escalations"),
      bearerToken: userToken,
    );
  }

  Future updateEscalation(
      {required int id,
      required String status,
      bool isResolved = false}) async {
    String userToken = Backpack.instance.read(Keys.bearerToken);
    return await network(
      bearerToken: userToken,
      request: (request) => request.put("/api/escalations/$id", data: {
        "status": status,
        "updated_at": DateTime.now().toDateTimeString(),
        if (isResolved) "resolved_date": DateTime.now().toDateTimeString(),
      }),
    );
  }
}
