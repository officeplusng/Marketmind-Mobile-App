import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/_shared/data/source/news_source.dart';
import '../../data/dto/new_dto.dart';

@lazySingleton
class NewsRepository {
  final NewsSource _source;

  NewsRepository(this._source);

  Future<ApiResult<List<Article>>> getFinancialNews({
    String sources =
        'bloomberg,reuters,cnbc,financial-times,the-wall-street-journal',
    int page = 1,
  }) async {
    return ApiResultWrapper.wrap(() async {
      final response =
          await _source.financialNews(page: page, sources: sources);
      if(response.data.keys.isEmpty){
        return [];
      }
      final data = FinancialNewsData.fromJson(response.data);

      return data.combinedArticles;
    });
  }

  Future<ApiResult<List<Article>>> combinedNewsData(
      {required String symbol}) async {
    return ApiResultWrapper.wrap(() async {
      final response = await _source.combinedNews(symbol: symbol);
      if(response.data.keys.isEmpty){
        return [];
      }
      final data = NewsData.fromJson(response.data);
      return data.combinedArticles;
    });
  }
}
