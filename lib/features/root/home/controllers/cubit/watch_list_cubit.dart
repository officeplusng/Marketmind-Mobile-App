import 'dart:convert';

import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/home/data/dto/watch_list_model.dart';
import 'package:marketmind/features/root/home/domain/repository/watch_list_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../../../../../core/di/injectable.dart';

class WatchListCubit extends BaseCubit<List<WatchListModel>> {
  late WatchListRepository _repository;

  late SecureStorageService _secureStorageService;

  WatchListCubit() : super(const InitialState(data: [])) {
    _repository = getIt<WatchListRepository>();
    _secureStorageService = getIt<SecureStorageService>();
  }

  init() async {
    final localResult = await _secureStorageService.get(StorageKeys.watchlist);
    if (localResult != null) {
      final json = jsonDecode(localResult) as Map<String, dynamic>;
      final data = json['data'] as List<dynamic>;
      final items =
          data.map((e) => WatchListModel.fromJson(jsonDecode(e))).toList();
      emitSuccess(data: items);
    }
    await getWatchList();
  }

  void removeWatchList(int index) {
    final items = state.data ?? [];
    items.removeAt(index);
    emitSuccess(data: items);
  }

  void submitWatchList() {}

  Future<void> getWatchList() async {
    final response = await _repository.fetchWatchList();
    response.when(onSuccess: (result) async {
      await _secureStorageService.write(
          StorageKeys.watchlist,
          jsonEncode(
              {'data': result.map((e) => jsonEncode(e.toJson())).toList()}));
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }
}
