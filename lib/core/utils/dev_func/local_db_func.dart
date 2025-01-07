import 'package:hive/hive.dart';

class LocalDbFunc {
  static Future<void> closetBoxClear() async =>
      await Hive.deleteBoxFromDisk("MyClosetDB");

  static Future<void> mySizeBoxClear() async =>
      await Hive.deleteBoxFromDisk("MySizeDB");
}
