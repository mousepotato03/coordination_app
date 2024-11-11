// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:coordination_app/data/data_source/data_source_module.dart'
    as _i128;
import 'package:coordination_app/data/data_source/local/my_size_info.dao.dart'
    as _i106;
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
    gh.singleton<_i106.MySizeDao>(() => dataSourceModule.mySizeDao);
    return this;
  }
}

class _$DataSourceModule extends _i128.DataSourceModule {}
