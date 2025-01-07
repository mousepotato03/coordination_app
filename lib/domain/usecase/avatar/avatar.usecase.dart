import 'package:injectable/injectable.dart';

import '../../repository/avatar.repository.dart';
import '../base/usecase.dart';

@singleton
class AvatarUsecase {
  final AvatarRepository _avatarRepository;

  AvatarUsecase(this._avatarRepository);

  Future<T> execute<T>({required Usecase usecase}) async {
    return await usecase(_avatarRepository);
  }
}
