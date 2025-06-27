import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:marketmind/features/_shared/data/dto/new_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'news_source.g.dart';

@RestApi(baseUrl: aiBaseUrl)
abstract class NewsSource {
  factory NewsSource(Dio dio, {String baseUrl}) = _NewsSource;

  @GET("/financial")
  Future<GenericNewsResponse> financialNews(
      {@Query('sort_order') String sortOrder = 'publishAt',
      @Query('page_size') int pageSize = 50,
      @Query('page') int page = 1,
      @Query('sources') required String sources });

  @GET("/combined")
  Future<GenericNewsResponse> combinedNews({
    @Query('symbol') required String symbol,
    @Query('include_sentiment') bool includeSentiment = true,
    @Query('page_size') int pageSize = 50,
    @Query('days_back') int page = 30,
  });
}
