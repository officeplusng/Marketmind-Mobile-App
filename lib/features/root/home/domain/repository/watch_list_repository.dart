import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/root/home/data/dto/watch_list_dto.dart';

import 'package:marketmind/core/network/api_result.dart';

@lazySingleton
class WatchListRepository {
  Future<ApiResult<List<WatchListDto>>> fetchTradingInsight() async {
    return ApiResultWrapper.wrap(() async {
      await Future.delayed(const Duration(seconds: 3));
      return WatchListDto.dummyWatchList;
    });
  }
}
