import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nillq_doctor_app/services/networkConfig.dart';
import 'package:nillq_doctor_app/services/saveToken.dart';

class Authentication {
  //handles user login.
  Future<Map<String, dynamic>> login(String loginId, String password) async {
    String api = "http://$ip:7000/api/auth/doctor-login";
    try {
      final response = await http
          .post(Uri.parse(api), body: {"email": loginId, "password": password});
      if (response.statusCode == 200) {
        Map<String, dynamic> accessToken = jsonDecode(response.body);
        print(accessToken);
        return accessToken;
      } else {
        Map<String, dynamic> errorMessage = jsonDecode(response.body);
        return Future.error(errorMessage);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  //Validates the access token if present.
  Future<String?> validateToken(String token) async {
    String api = "http://$ip:7000/api/auth/validate-token";

    try {
      print('token from validation fun: $token');
      final response = await http.post(Uri.parse(api), body: {"token": token.toString()});
      if (response.statusCode == 200 || response.statusCode == 401) {
        Map<String, dynamic> tokenStatus = jsonDecode(response.body);
        return tokenStatus['message'].toString();
      } else {
        Map<String, dynamic> errorMessage = jsonDecode(response.body);
        print('validation error : $errorMessage');
        throw Exception(errorMessage);
      }
    } catch (error) {
      print('catch error : $error');
      throw Exception(error);
    }
  }

  //function to handle logout
  Future<String?> logout() async {
    TokenManager tokenManager = TokenManager();
    String api = "http://$ip:7000/api/auth/logout";
    try {
      final response = await http.post(Uri.parse(api),
          body: {"token": await tokenManager.readToken()});
      if (response.statusCode == 200) {
        Map<String, String> reply = jsonDecode(response.body);
        return reply['message'];
      } else {
        Map<String, String> errorMessage = jsonDecode(response.body);
        print("error from try: $errorMessage");
        throw Exception(errorMessage);
      }
    } catch (error) {
      print("error from catch: $error");
      throw Exception(error.toString());
    }
  }
}
