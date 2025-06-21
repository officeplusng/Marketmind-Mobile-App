// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:marketmind/core/export/export.core.dart' as _i56;
import 'package:marketmind/core/local/secured_storage_service.dart' as _i497;
import 'package:marketmind/core/network/interceptor.dart' as _i1025;
import 'package:marketmind/core/network/network_service.dart' as _i1056;
import 'package:marketmind/features/_shared/data/source/upload_source.dart'
    as _i258;
import 'package:marketmind/features/_shared/data/source/user_source.dart'
    as _i156;
import 'package:marketmind/features/_shared/domain/new_repository.dart'
    as _i1042;
import 'package:marketmind/features/_shared/domain/repo/upload_repository.dart'
    as _i500;
import 'package:marketmind/features/_shared/domain/repo/user_repository.dart'
    as _i847;
import 'package:marketmind/features/authentication/data/source/auth_source.dart'
    as _i2;
import 'package:marketmind/features/authentication/domain/repositories/auth_repository.dart'
    as _i936;
import 'package:marketmind/features/root/home/data/source/referral_source.dart'
    as _i484;
import 'package:marketmind/features/root/home/data/source/trading_insight_source.dart'
    as _i496;
import 'package:marketmind/features/root/home/domain/repository/referral_repository.dart'
    as _i329;
import 'package:marketmind/features/root/home/domain/repository/trading_insight_repository.dart'
    as _i131;
import 'package:marketmind/features/root/home/domain/repository/watch_list_repository.dart'
    as _i956;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i497.SecureStorageService>(
        () => _i497.SecureStorageService());
    gh.lazySingleton<_i956.WatchListRepository>(
        () => _i956.WatchListRepository());
    gh.lazySingleton<_i1042.NewsRepository>(() => _i1042.NewsRepository());
    gh.lazySingleton<_i1025.NetworkInterceptor>(
        () => _i1025.NetworkInterceptor(gh<_i497.SecureStorageService>()));
    gh.lazySingleton<_i361.Dio>(
        () => networkModule.dio(gh<_i1025.NetworkInterceptor>()));
    gh.lazySingleton<_i2.AuthSource>(
        () => networkModule.apiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i156.UserSource>(
        () => networkModule.userSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i496.TradingInsightSource>(
        () => networkModule.tradingInsightSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i258.UploadSource>(
        () => networkModule.uploadSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i484.ReferralSource>(
        () => networkModule.referralSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i936.AuthRepository>(
        () => _i936.AuthRepository(gh<_i2.AuthSource>()));
    gh.lazySingleton<_i847.UserRepository>(() => _i847.UserRepository(
          gh<_i156.UserSource>(),
          gh<_i56.SecureStorageService>(),
        ));
    gh.lazySingleton<_i500.UploadRepository>(
        () => _i500.UploadRepository(gh<_i258.UploadSource>()));
    gh.lazySingleton<_i131.TradingInsightRepository>(
        () => _i131.TradingInsightRepository(gh<_i496.TradingInsightSource>()));
    gh.lazySingleton<_i329.ReferralRepository>(
        () => _i329.ReferralRepository(gh<_i484.ReferralSource>()));
    return this;
  }
}

class _$NetworkModule extends _i1056.NetworkModule {}
