import 'package:injectable/injectable.dart';

import '../../repository/my_closet.repository.dart';
import '../base/usecase.dart';

@singleton
class MyClosetUsecase {
  final MyClosetRepository _myClosetRepository;

  MyClosetUsecase(this._myClosetRepository);

  Future<T> execute<T>({required Usecase usecase}) async {
    return await usecase(_myClosetRepository);
  }
}
