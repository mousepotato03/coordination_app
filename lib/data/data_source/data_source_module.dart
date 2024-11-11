import 'package:injectable/injectable.dart';

import 'local/my_size_info.dao.dart';

@module
abstract class DataSourceModule {
  @singleton
  MySizeDao get mySizeDao => MySizeDao();
}
