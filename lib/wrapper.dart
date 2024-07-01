import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/authentication/login.dart';
import 'package:nillq_doctor_app/screens/home/bottomNavBar.dart';
import 'package:nillq_doctor_app/services/saveToken.dart';
import 'package:nillq_doctor_app/services/userAuthentication.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class Wrapper extends StatefulWidget {
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  TokenManager tokenManager = TokenManager();

  Authentication authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    if (tokenManager.isTokenPresent()) {
      return Scaffold(
        body: FutureBuilder(
            future: authentication.validateToken(tokenManager.readToken()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong!!!'),
                );
              } else {
                String responseMessage = snapshot.data!;
                if (responseMessage == 'valid') {
                  return BottomNavBar();
                } else {
                  return Login();
                }
              }
            }),
      );
    } else {
      return Login();
    }
  }
}
