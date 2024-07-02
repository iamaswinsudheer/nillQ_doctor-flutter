import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  late String  key = "accessToken";

  Future<void> saveToken(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, token);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> destroyToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<String> readToken() async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key)!;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  Future<bool> isTokenPresent() async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.containsKey(key);
    } catch (error) {
      throw Exception(error);
    }
  }
}
