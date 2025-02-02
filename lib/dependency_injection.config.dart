// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:coordination_app/data/data_source/data_source_module.dart'
    as _i128;
import 'package:coordination_app/data/data_source/local/my_closet.dao.dart'
    as _i1010;
import 'package:coordination_app/data/data_source/local/my_size_info.dao.dart'
    as _i899;
import 'package:coordination_app/data/data_source/remote/gpt.api.dart' as _i862;
import 'package:coordination_app/data/data_source/remote/image_to_uv_map.api.dart'
    as _i742;
import 'package:coordination_app/data/repository_impl/avatar.repository.impl.dart'
    as _i295;
import 'package:coordination_app/data/repository_impl/my_closet.repository.impl.dart'
    as _i862;
import 'package:coordination_app/data/repository_impl/my_outfit.repository.impl.dart'
    as _i825;
import 'package:coordination_app/data/repository_impl/my_size_info.repository.impl.dart'
    as _i149;
import 'package:coordination_app/data/repository_impl/user.repository.impl.dart'
    as _i55;
import 'package:coordination_app/domain/repository/avatar.repository.dart'
    as _i441;
import 'package:coordination_app/domain/repository/my_closet.repository.dart'
    as _i490;
import 'package:coordination_app/domain/repository/my_outfit.repository.dart'
    as _i675;
import 'package:coordination_app/domain/repository/my_size_info.repository.dart'
    as _i27;
import 'package:coordination_app/domain/repository/user.repository.dart'
    as _i160;
import 'package:coordination_app/domain/usecase/avatar/avatar.usecase.dart'
    as _i857;
import 'package:coordination_app/domain/usecase/my_closet/my_closet.usecase.dart'
    as _i314;
import 'package:coordination_app/domain/usecase/my_outfit/my_outfit.usecase.dart'
    as _i944;
import 'package:coordination_app/domain/usecase/my_size/my_size_info.usecase.dart'
    as _i266;
import 'package:coordination_app/domain/usecase/user/user.usecase.dart'
    as _i784;
import 'package:coordination_app/presentation/main/bottom_sheet/closet/riverpod/closet_provider.dart'
    as _i519;
import 'package:coordination_app/presentation/main/riverpod/user_state_provider.dart'
    as _i890;
import 'package:coordination_app/presentation/pages/avatar/riverpod/avatar_state_provider.dart'
    as _i521;
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
    gh.singleton<_i1010.MyClosetDao>(() => dataSourceModule.myClosetDao);
    gh.singleton<_i742.ImageToUvMapApi>(() => dataSourceModule.imageToUvMapApi);
    gh.singleton<_i862.GptApi>(() => dataSourceModule.gptApi);
    gh.singleton<_i441.AvatarRepository>(() => _i295.AvatarRepositoryImpl(
          gh<_i899.MySizeDao>(),
          gh<_i1010.MyClosetDao>(),
        ));
    gh.singleton<_i160.UserRepository>(() => _i55.UserRepositoryImpl());
    gh.singleton<_i490.MyClosetRepository>(() => _i862.MyClosetRepositoryImpl(
          gh<_i1010.MyClosetDao>(),
          gh<_i742.ImageToUvMapApi>(),
        ));
    gh.singleton<_i27.MySizeInfoRepository>(
        () => _i149.MySizeInfoRepositoryImpl(gh<_i899.MySizeDao>()));
    gh.singleton<_i857.AvatarUsecase>(
        () => _i857.AvatarUsecase(gh<_i441.AvatarRepository>()));
    gh.singleton<_i675.MyOutfitRepository>(
        () => _i825.MyOutfitRepositoryImpl(gh<_i862.GptApi>()));
    gh.singleton<_i784.UserUsecase>(
        () => _i784.UserUsecase(gh<_i160.UserRepository>()));
    gh.factory<_i890.UserNotifier>(
        () => _i890.UserNotifier(gh<_i784.UserUsecase>()));
    gh.singleton<_i266.MySizeInfoUsecase>(
        () => _i266.MySizeInfoUsecase(gh<_i27.MySizeInfoRepository>()));
    gh.singleton<_i314.MyClosetUsecase>(
        () => _i314.MyClosetUsecase(gh<_i490.MyClosetRepository>()));
    gh.factory<_i952.MySizeInfoNotifier>(
        () => _i952.MySizeInfoNotifier(gh<_i266.MySizeInfoUsecase>()));
    gh.singleton<_i944.MyOutfitUsecase>(
        () => _i944.MyOutfitUsecase(gh<_i675.MyOutfitRepository>()));
    gh.factory<_i519.ClosetNotifier>(
        () => _i519.ClosetNotifier(gh<_i314.MyClosetUsecase>()));
    gh.factory<_i521.AvatarNotifier>(() => _i521.AvatarNotifier(
          gh<_i857.AvatarUsecase>(),
          gh<_i944.MyOutfitUsecase>(),
        ));
    return this;
  }
}

class _$DataSourceModule extends _i128.DataSourceModule {}
