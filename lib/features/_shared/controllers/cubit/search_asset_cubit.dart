import 'package:marketmind/src/state_management/base_cubit.dart';

import '../../../../core/di/injectable.dart';
import '../../../../src/state_management/cubit_state.dart';
import '../../data/dto/search_dto.dart';
import '../../domain/repo/search_asset_repository.dart';

class SearchAssetCubit extends BaseCubit<List<BestMatch>> {
  late SearchAssetRepository _repository;

  SearchAssetCubit() : super(const InitialState(data: [])) {
    _repository = getIt<SearchAssetRepository>();
  }

  void search(String keyword) async {
    emitLoading();
    final response = await _repository.searchStock(
      keyword,
    );
    response.when(onSuccess: (result) {
      final data = result.data?.bestMatches ?? [];
      emitSuccess(data: data);
    }, onError: (error) {
      emitError(error);
    });
  }
}
