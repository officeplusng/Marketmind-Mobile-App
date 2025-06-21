import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/exceptions/api_exception.dart';
import 'package:marketmind/core/network/api_result.dart';

class ApiResultWrapper {
  static Future<ApiResult<T>> wrap<T>(Future<T> Function() func) async {
    try {
      final result = await func.call();
      return Success(data: result);
    } on DioException catch (e) {
      final error = e.error as ApiException;
      return Failure(error: error.message);
    } catch (e,trace) {
      debugPrintStack(stackTrace:trace );
      return Failure(error: e.toString());
    }
  }
}
