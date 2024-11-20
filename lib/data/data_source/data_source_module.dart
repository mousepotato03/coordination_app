import 'package:injectable/injectable.dart';

import 'local/my_closet.dao.dart';
import 'local/my_size_info.dao.dart';

@module
abstract class DataSourceModule {
  @singleton
  MySizeDao get mySizeDao => MySizeDao();

  @singleton
  MyClosetDao get myClosetDao => MyClosetDao();
}
