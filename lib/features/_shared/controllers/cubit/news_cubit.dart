import 'package:marketmind/features/_shared/data/dto/new_dto.dart';
import 'package:marketmind/features/_shared/domain/new_repository.dart';
import 'package:marketmind/features/_shared/domain/repo/news_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import 'package:marketmind/core/di/injectable.dart';

typedef NewsCubitState = BaseState<List<Article>>;
class NewsCubit extends BaseCubit<List<Article>> {
  late NewsRepository _repository;

  NewsCubit() : super(const InitialState()) {
    _repository = getIt<NewsRepository>();
  }

  void fetchNews() async {
    final response = await _repository.getFinancialNews();
    response.when(onSuccess: (result) {
      emitSuccess(data: result);
    }, onError: (error) {
      emitError(error);
    });
  }
}
