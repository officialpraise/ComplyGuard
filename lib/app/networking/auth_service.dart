import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/networking/dio/interceptors/logging_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* AuthService
| -------------------------------------------------------------------------
| Define your API endpoints
| Learn more https://nylo.dev/docs/6.x/networking
|-------------------------------------------------------------------------- */

class AuthService extends NyApiService {
  AuthService({BuildContext? buildContext})
      : super(
          buildContext,
          decoders: modelDecoders,
          // baseOptions: (BaseOptions baseOptions) {
          //   return baseOptions
          //             ..connectTimeout = Duration(seconds: 5)
          //             ..sendTimeout = Duration(seconds: 5)
          //             ..receiveTimeout = Duration(seconds: 5);
          // },
        );

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  get interceptors => {
        if (getEnv('APP_DEBUG') == true) PrettyDioLogger: PrettyDioLogger(),
        LoggingInterceptor: LoggingInterceptor()
      };

  Future register(Map<String, dynamic> payLoad) async {
    return await network(
      request: (request) => request.post("/api/auth/register", data: payLoad),
    );
  }

  Future login(Map<String, dynamic> payLoad) async {
    return await network(
      request: (request) => request.post("/api/auth/login", data: payLoad),
    );
  }

  /* Helpers
  |-------------------------------------------------------------------------- */

  /* Authentication Headers
  |--------------------------------------------------------------------------
  | Set your auth headers
  | Authenticate your API requests using a bearer token or any other method
  |-------------------------------------------------------------------------- */

  // @override
  // Future<RequestHeaders> setAuthHeaders(RequestHeaders headers) async {
  //   String? myAuthToken = await Keys.bearerToken.read();
  //   if (myAuthToken != null) {
  //     headers.addBearerToken( myAuthToken );
  //   }
  //   return headers;
  // }

  /* Should Refresh Token
  |--------------------------------------------------------------------------
  | Check if your Token should be refreshed
  | Set `false` if your API does not require a token refresh
  |-------------------------------------------------------------------------- */

  // @override
  // Future<bool> shouldRefreshToken() async {
  //   return false;
  // }

  /* Refresh Token
  |--------------------------------------------------------------------------
  | If `shouldRefreshToken` returns true then this method
  | will be called to refresh your token. Save your new token to
  | local storage and then use the value in `setAuthHeaders`.
  |-------------------------------------------------------------------------- */

  // @override
  // refreshToken(Dio dio) async {
  //  dynamic response = (await dio.get("https://example.com/refresh-token")).data;
  //  // Save the new token
  //   await Keys.bearerToken.save(response['token']);
  // }
}
