import 'package:shared_preferences/shared_preferences.dart';

class DocIdManager {
  String key = 'doctorId';

  Future<void> saveDocId(String docId) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, docId);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> destroyDocId() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<String> readDocId() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key)!;
    } catch (error) {
      throw Exception(error);
    }
  }
}
