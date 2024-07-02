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
  
  //function to check whether user is authenticated
  Future<bool> isUserAuthenticated() async {
    TokenManager tokenManager = TokenManager();
    Authentication authentication = Authentication();
    bool tokenPresent = await tokenManager.isTokenPresent();
    String tokenStatus = await authentication.validateToken();
    if (tokenPresent && tokenStatus == 'valid') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: isUserAuthenticated(),
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
              bool AuthenticatedUser = snapshot.data!;
              if (AuthenticatedUser) {
                return BottomNavBar();
              } else {
                return Login();
              }
            }
          }),
    );
  }
}
