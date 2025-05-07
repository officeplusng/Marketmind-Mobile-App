import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'interceptor.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(NetworkInterceptor interceptor) {
    final dio = Dio();

    // Add Interceptors
    dio.interceptors.add(interceptor);

    // Enable logging
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));

    return dio;
  }
}
