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
import 'package:marketmind/core/local/secured_storage_service.dart' as _i497;
import 'package:marketmind/core/network/interceptor.dart' as _i1025;
import 'package:marketmind/core/network/network_service.dart' as _i1056;

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
    gh.lazySingleton<_i1025.NetworkInterceptor>(
        () => _i1025.NetworkInterceptor(gh<_i497.SecureStorageService>()));
    gh.lazySingleton<_i361.Dio>(
        () => networkModule.dio(gh<_i1025.NetworkInterceptor>()));
    return this;
  }
}

class _$NetworkModule extends _i1056.NetworkModule {}
