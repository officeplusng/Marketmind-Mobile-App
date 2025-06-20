import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../exceptions/api_exception.dart';
import '../local/secured_storage_service.dart';

@lazySingleton
class NetworkInterceptor extends Interceptor {
  final SecureStorageService _secureStorageService;

  NetworkInterceptor(this._secureStorageService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Fetch the token from Secure Storage
    String? token = await _secureStorageService.getToken();

    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = "Something went wrong";
    int? statusCode = err.response?.statusCode;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      errorMessage = "Connection timeout, please try again.";
    } else if (err.type == DioExceptionType.badResponse) {
      switch (statusCode) {
        case 400:
          errorMessage = "Bad request. Please check your input.";
          break;
        case 401:
          errorMessage = "Unauthorized. Please log in again.";
          break;
        case 403:
          errorMessage = "Forbidden access.";
          break;
        case 404:
          errorMessage = "Resource not found.";
          break;
        case 500:
          errorMessage = "Internal server error. Try again later.";
          break;
        default:
          errorMessage = "Unexpected error occurred.";
      }
    } else if (err.type == DioExceptionType.cancel) {
      errorMessage = "Request was cancelled.";
    } else if (err.type == DioExceptionType.unknown) {
      errorMessage = "No internet connection.";
    }

    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: ApiException( errorMessage, statusCode: statusCode),
    ));
  }
}
