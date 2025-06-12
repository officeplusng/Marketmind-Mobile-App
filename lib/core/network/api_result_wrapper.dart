import 'package:marketmind/core/network/api_result.dart';

class ApiResultWrapper{

  static Future<ApiResult<T>> wrap<T>(Future<T> Function() func) async {
    try{
      final result = await func.call();
      return Success(data: result);
    }catch(e){
      return Failure(error: e.toString());
    }
  }
}