import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  late String key;
  late SharedPreferences prefs;

  TokenManager() {
    key = "accessToken";
    _initialize();
  }

  Future<void> _initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveToken(String token) async {
    try {
      await prefs.setString(key, token);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> destroyToken() async {
    try {
      await prefs.remove(key);
    } catch (error) {
      throw Exception(error);
    }
  }

  String readToken() {
    try {
      return prefs.getString(key)!;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  bool isTokenPresent() {
    try {
      return prefs.containsKey(key);
    } catch (error) {
      throw Exception(error);
    }
  }
}
