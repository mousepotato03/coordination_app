import 'package:injectable/injectable.dart';

import '../../repository/user.repository.dart';
import '../base/local.usecase.dart';

@singleton
class UserUsecase {
  final UserRepository _userRepository;

  UserUsecase(this._userRepository);

  Future<T> execute<T>({required LocalUsecase usecase}) async {
    return await usecase(_userRepository);
  }
}
