import 'package:dio/dio.dart';
import 'package:marketmind/core/events/refresh_token_event_bus.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/debouncer.dart';
import 'package:marketmind/core/network/repository/network_core_repository.dart';
import 'package:marketmind/core/util/event_bus.dart';

class ApiResultWrapper {
  static Future<ApiResult<T>> wrap<T>(Future<T> Function() func) async {
    try {
      final result = await func.call();
      return Success(data: result);
    } on DioException catch (e) {
      final error = e.error as ApiException;
      if (error.statusCode == 403) {
        tokenRefresh();
      }
      return Failure(error: error.message, code: error.statusCode);
    } catch (e, trace) {
      debugPrintStack(stackTrace: trace);
      return Failure(error: e.toString(), code: -1);
    }
  }

  static void tokenRefresh() async {
    DeBouncer.run(
        key: 'refresh-token',
        action: () async {
          final pref = getIt<SecureStorageService>();
          final repository = getIt<NetworkCoreRepository>();
          final _refreshToken = await pref.get(StorageKeys.refreshToken);
          if (_refreshToken != null) {
            await pref.tearDown();
            eventBus.fire(RefreshTokenEventBus());
            // repository.refreshToken(_refreshToken);
          }
        },
        milliseconds: 2000);
  }

  static Future<ApiResult<T>> wrapValue<T>({
    required Future<dynamic> Function() func,
    T Function(dynamic)? mapper,
  }) async {
    try {
      final result = await func.call();
      if (mapper != null) {
        final finalResult = mapper(result);
        return Success(data: finalResult);
      }

      return Success(data: result);
    } on DioException catch (dioException, trace) {
      final error = dioException.error as ApiException;
      debugPrintStack(stackTrace: trace);
      return Failure(error: error.message, code: -1);
    } catch (e, trace) {
      debugPrintStack(stackTrace: trace);
      return Failure(error: e.toString(), code: -1);
    }
  }

  static Future<ApiResult<T>> wrapList<T>({
    required Future<dynamic> Function() func,
    required T Function(List<dynamic>) mapper,
  }) async {
    try {
      final result = await func.call();
      if (result is List<dynamic>) {
        final list = result;
        final finalResult = mapper(list);
        return Success(data: finalResult);
      }
      final finalResult = mapper(result.data);
      return Success(data: finalResult);
    } on DioException catch (dioException) {
      final error = dioException.error as ApiException;
      return Failure(error: error.message, code: -1);
    } catch (e, trace) {
      return Failure(error: e.toString(), code: -1);
    }
  }
}
