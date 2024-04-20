import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  String key = "accessToken";

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, token);
    print('token saved');
  }

  Future<void> destroyToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<String> readToken() async {
    try{
      print('reading token');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key)!;
    } catch (exception){
      print('exception: $exception');
      throw Exception(exception);
    }
  }

  Future<bool> isTokenPresent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
