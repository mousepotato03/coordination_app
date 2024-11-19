// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:coordination_app/data/data_source/data_source_module.dart'
    as _i128;
import 'package:coordination_app/data/data_source/local/closet.dao.dart'
    as _i476;
import 'package:coordination_app/data/data_source/local/my_size_info.dao.dart'
    as _i899;
import 'package:coordination_app/data/repository_impl/my_size_info.repository.impl.dart'
    as _i149;
import 'package:coordination_app/domain/repository/my_size_info.repository.dart'
    as _i27;
import 'package:coordination_app/domain/usecase/my_size/my_size_info.usecase.dart'
    as _i266;
import 'package:coordination_app/presentation/pages/profile/riverpod/my_size_info_provider.dart'
    as _i952;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    final dataSourceModule = _$DataSourceModule();
    gh.singleton<_i899.MySizeDao>(() => dataSourceModule.mySizeDao);
    gh.singleton<_i476.MyClosetDao>(() => dataSourceModule.myClosetDao);
    gh.singleton<_i27.MySizeInfoRepository>(
        () => _i149.MySizeInfoRepositoryImpl(gh<_i899.MySizeDao>()));
    gh.singleton<_i266.MySizeInfoUsecase>(
        () => _i266.MySizeInfoUsecase(gh<_i27.MySizeInfoRepository>()));
    gh.factory<_i952.MySizeInfoNotifier>(
        () => _i952.MySizeInfoNotifier(gh<_i266.MySizeInfoUsecase>()));
    return this;
  }
}

class _$DataSourceModule extends _i128.DataSourceModule {}
