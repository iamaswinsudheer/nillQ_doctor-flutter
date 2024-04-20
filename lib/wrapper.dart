import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nillq_doctor_app/screens/authentication/login.dart';
import 'package:nillq_doctor_app/screens/home/bottomNavBar.dart';
import 'package:nillq_doctor_app/services/saveToken.dart';
import 'package:nillq_doctor_app/services/userAuthentication.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  TokenManager tokenManager = new TokenManager();
  Authentication authentication = new Authentication();

  Future<bool> isUserAuthenticated() async {
    if (await tokenManager.isTokenPresent()) {
      print('token is present');
      String token = await tokenManager.readToken();
      print(token);
      print(await authentication.validateToken(token));
      if (await authentication.validateToken(token) == 'Token valid') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Widget errorDialog() {
    return AlertDialog(
      title: Text('Error'),
      content: Text('App launch failed'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child: Text('EXIT APP'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> futureIsTokenPresent = isUserAuthenticated();
    return FutureBuilder(
        future: futureIsTokenPresent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return errorDialog();
          } else {
            bool isAuthenticatedUser = snapshot.data!;
            if (isAuthenticatedUser) {
              return BottomNavBar();
            } else {
              return StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return BottomNavBar();
                    } else {
                      return Login();
                    }
                  });
            }
          }
        });
  }
}
