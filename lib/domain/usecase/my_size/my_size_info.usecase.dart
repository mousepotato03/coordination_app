import 'package:coordination_app/domain/repository/my_size_info.repository.dart';
import 'package:injectable/injectable.dart';

import '../base/usecase.dart';

@singleton
class MySizeInfoUsecase {
  final MySizeInfoRepository _mySizeInfoRepository;

  MySizeInfoUsecase(this._mySizeInfoRepository);

  Future<T> excute<T> ({required Usecase usecase})async{
    return await usecase(_mySizeInfoRepository);
  }
}
