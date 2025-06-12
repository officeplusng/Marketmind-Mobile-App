import 'package:marketmind/features/root/home/data/dto/watch_list_dto.dart';
import 'package:marketmind/features/root/home/domain/repository/watch_list_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../../../../../core/di/injectable.dart';
import '../../../../../core/local/secured_storage_service.dart';

class WatchListCubit extends BaseCubit<List<WatchListDto>> {
  late WatchListRepository _repository;

  late SecureStorageService _storageService;
  WatchListCubit():super(InitialState()) {
    _repository = getIt<WatchListRepository>();
    _storageService = getIt<SecureStorageService>();
  }

  void removeWatchList(int index){
    final items = state.data??[];
    items.removeAt(index);
    emitSuccess(data: items);
  }
  void fetchWatchList() async {
    emitLoading();
    final result = await _repository.fetchTradingInsight();
    result.when(onSuccess: (data) {
      emitSuccess(data: data);
    }, onError: (error) {
      emitError(error);
    });
    // if (result is Success<List<TradingInsightDto>>) {
    //   emitSuccess(data: result.data);
    // }
    // if(result is Failure<List<TradingInsightDto>>){
    //   emitError(result.error);
    // }
  }
}
