import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/features/root/home/data/dto/referral_dto.dart';
import 'package:marketmind/features/root/home/domain/repository/referral_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class ReferralsCubit extends BaseCubit<List<ReferralDto>> {
  late ReferralRepository _repository;

  ReferralsCubit() : super(InitialState()) {
    _repository = getIt<ReferralRepository>();
  }

  void fetchReferrals() async {
    emitLoading();
    final response = await _repository.getReferrals();
    response.when(onSuccess: (result) {
      for(var i in result){
        print(i.toJson());
      }
      emitSuccess(data: result);
    }, onError: (error) {
      print('error -> $error');
      emitError(error);
    });
  }
}
