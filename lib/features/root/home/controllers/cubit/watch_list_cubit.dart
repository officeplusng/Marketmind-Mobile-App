import 'package:marketmind/features/root/home/data/dto/watch_list_model.dart';
import 'package:marketmind/features/root/home/domain/repository/watch_list_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../../../../../core/di/injectable.dart';
class WatchListCubit extends BaseCubit<List<WatchListModel>> {
  late WatchListRepository _repository;


  WatchListCubit() : super(InitialState()) {
    _repository = getIt<WatchListRepository>();
  }

  void removeWatchList(int index) {
    final items = state.data ?? [];
    items.removeAt(index);
    emitSuccess(data: items);
  }

  void submitWatchList(){

  }

  void getWatchList() async {
    final response = await _repository.fetchWatchList();
    response.when(onSuccess: (result) {}, onError: (error) {});
  }

}
