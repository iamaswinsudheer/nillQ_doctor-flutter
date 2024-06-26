import 'package:shared_preferences/shared_preferences.dart';

class DocIdManager {
  late String key;
  late SharedPreferences prefs;

  DocIdManager() {
    key = 'doctorId';
    _initialize();
  }

  Future<void> _initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveDocId(String docId) async {
    try {
      await prefs.setString(key, docId);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> destroyDocId() async {
    try {
      await prefs.remove(key);
    } catch (error) {
      throw Exception(error);
    }
  }

  String readDocId() {
    try {
      return prefs.getString(key)!;
    } catch (error) {
      throw Exception(error);
    }
  }
}
