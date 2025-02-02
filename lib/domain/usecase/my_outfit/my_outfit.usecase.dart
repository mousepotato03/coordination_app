import 'package:coordination_app/domain/repository/my_outfit.repository.dart';
import 'package:injectable/injectable.dart';

import '../base/usecase.dart';

@singleton
class MyOutfitUsecase {
  final MyOutfitRepository _myOutfitRepository;

  MyOutfitUsecase(this._myOutfitRepository);

  Future<T> execute<T>({required Usecase usecase}) async {
    return await usecase(_myOutfitRepository);
  }
}
