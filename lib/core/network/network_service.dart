import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:marketmind/features/_shared/data/source/chart_source.dart';
import 'package:marketmind/features/_shared/data/source/search_asset_source.dart';
import 'package:marketmind/features/_shared/data/source/upload_source.dart';
import 'package:marketmind/features/_shared/data/source/user_source.dart';
import 'package:marketmind/features/authentication/data/source/auth_source.dart';
import 'package:marketmind/features/root/home/data/source/referral_list_source.dart';
import 'package:marketmind/features/root/home/data/source/referral_source.dart';
import 'package:marketmind/features/root/home/data/source/trading_insight_source.dart';
import 'package:marketmind/features/root/home/data/source/watch_list_source.dart';
import '../../features/_shared/data/source/news_source.dart';
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

  @lazySingleton
  AuthSource apiService(Dio dio) =>
      AuthSource(dio, baseUrl: '$apiBaseUrl/auth');

  @lazySingleton
  UserSource userSource(Dio dio) =>
      UserSource(dio, baseUrl: '$apiBaseUrl/users');
  @lazySingleton
  SearchAssetSource searchAssetSource(Dio dio) =>
      SearchAssetSource(dio, baseUrl: aiBaseUrl);
  @lazySingleton
  NewsSource newsSource(Dio dio) =>
      NewsSource(dio, baseUrl: '$aiBaseUrl/news');
  @lazySingleton
  ChartSource chartSource(Dio dio) =>
      ChartSource(dio, baseUrl: aiBaseUrl);
  @lazySingleton
  ReferralListSource referralListSource(Dio dio) =>
      ReferralListSource(dio, baseUrl: aiBaseUrl);

  @lazySingleton
  TradingInsightSource tradingInsightSource(Dio dio) =>
      TradingInsightSource(dio, baseUrl: '$aiBaseUrl/api');

  @lazySingleton
  UploadSource uploadSource(Dio dio) =>
      UploadSource(dio, baseUrl: '$apiBaseUrl/upload');

  @lazySingleton
  ReferralSource referralSource(Dio dio) =>
      ReferralSource(dio, baseUrl: apiBaseUrl);
  @lazySingleton
  WatchListSource watchListSource(Dio dio) =>
      WatchListSource(dio, baseUrl: apiBaseUrl);
}
