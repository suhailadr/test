import 'package:hive/hive.dart';

class LocalStorages {
  static Future<dynamic> getDataFrom<E>(
      {required String db, required String key}) async {
    final box = await Hive.openBox<E>(db);

    return await box.get(key);
  }

  static Future<dynamic> addDataTo<E>(
      {required String db, required String key, dynamic value}) async {
    final box = await Hive.openBox<E>(key);
    return await box.put(key, value);
  }
}
