import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/root/home/data/dto/watch_list_dto.dart';

import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/features/root/home/data/dto/watch_list_model.dart';

import '../../data/source/watch_list_source.dart';

@lazySingleton
class WatchListRepository {
  Future<ApiResult<List<WatchListDto>>> fetchTradingInsight() async {
    return ApiResultWrapper.wrap(() async {
      await Future.delayed(const Duration(seconds: 3));
      return WatchListDto.dummyWatchList;
    });
  }

  final WatchListSource _source;

  WatchListRepository(this._source);

  Future<ApiResult<List<WatchListModel>>> fetchWatchList() async {
    return ApiResultWrapper.wrap(() => _source.getWatchList());
  }
}
