import 'package:dio/dio.dart';

const baseUrl = "https://reqres.in/api";

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(
          BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: const Duration(seconds: 60),
              receiveTimeout:
                  const Duration(seconds: 60), 
              ),
        ) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
    ));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? option}) async {
    return dio.get(
      path,
      queryParameters: queryParameters,
      options: option,
    );
  }
}
