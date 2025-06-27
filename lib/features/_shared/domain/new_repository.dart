import 'package:injectable/injectable.dart';
import 'package:marketmind/features/_shared/data/dto/new_dto.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';

@lazySingleton
class FakeNewsRepository {
  Future<ApiResult<List<NewsDto>>> fetchTradingInsight() async {
    return ApiResultWrapper.wrap(() async {
      await Future.delayed(const Duration(seconds: 3));
      return NewsDto.dummyNews;
    });
  }
}
