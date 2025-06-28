import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/features/root/home/data/dto/referral_dto.dart';
import 'package:marketmind/features/root/home/data/source/referral_list_source.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class ReferralsCubit extends BaseCubit<List<ReferralDto>> {
  late ReferralListSource _repository;

  List<ReferralDto> allReferrals = [];

  ReferralsCubit() : super(InitialState()) {
    _repository = getIt<ReferralListSource>();
  }

  void search(String query) {
    final result = allReferrals
            .where((element) =>
                element.name?.toLowerCase().contains(query.toLowerCase()) ??
                false)
            .toList() ??
        [];
    emitSuccess(data: result);
  }

  void fetchReferrals() async {
    emitLoading();
    final response = await _repository.getReferrals();
    response.when(onSuccess: (result) {
      allReferrals = result;
      emitSuccess(data: result);
    }, onError: (error) {
      print('error -> $error');
      emitError(error);
    });
  }
}
