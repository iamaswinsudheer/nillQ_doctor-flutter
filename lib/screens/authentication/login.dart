import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/bottomNavBar.dart';
import 'package:nillq_doctor_app/screens/loadingScreen.dart';
import 'package:nillq_doctor_app/services/docIdManager.dart';
import 'package:nillq_doctor_app/services/saveToken.dart';
import 'package:nillq_doctor_app/services/userAuthentication.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  Authentication authentication = Authentication();
  TokenManager tokenManager = TokenManager();
  DocIdManager docIdManager = DocIdManager();
  late String loginId;
  late String password;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return _isLoading
        ? const LoadingIndicator()
        : Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: screenSize.width,
                  padding: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.08,
                      horizontal: screenSize.width * 0.1),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Text('test')
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/icons/medical-app.png',
                              width: 100.0,
                              height: 100.0,
                            ),
                            SizedBox(
                              width: screenSize.width * 0.03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'NillQ',
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: themeColor,
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.01,
                                ),
                                const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Empower your practice.',
                                    style: TextStyle(
                                        color: themeColor, fontSize: 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.08,
                        ),
                        Text(
                          'Login id',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.005,
                        ),
                        TextFormField(
                          cursorColor: Colors.grey,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Login id required';
                            } else {
                              loginId = value;
                              return null;
                            }
                          },
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom *
                                  1.2),
                          decoration: textInputDecorationWithTheme.copyWith(
                              hintText: 'Enter your login id',
                              hintStyle: TextStyle(color: Colors.grey[500])),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.005,
                        ),
                        TextFormField(
                          obscureText: true,
                          cursorColor: Colors.grey,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password required';
                            } else {
                              password = value;
                              return null;
                            }
                          },
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom *
                                  1.2),
                          decoration: textInputDecorationWithTheme.copyWith(
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(color: Colors.grey[500])),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.08,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              print('login id: $loginId, password: $password');
                              try {
                                setState(() {
                                  _isLoading = true;
                                });
                                Map<String, dynamic> loginResponse =
                                    await authentication.login(
                                        loginId, password);
                                print(loginResponse);
                                await tokenManager.saveToken(
                                    loginResponse['Token'].toString());
                                await docIdManager.saveDocId(
                                    loginResponse['Doctor_Id'].toString());
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const BottomNavBar()),
                                    (route) => false);
                                setState(() {
                                  _isLoading = false;
                                });
                              } catch (error) {
                                print(error);
                                setState(() {
                                  _isLoading = false;
                                });
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Login failed'),
                                        content: const Text(
                                            'Login attempt failed, please try again.'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Ok'))
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: themeColor,
                              minimumSize: const Size.fromHeight(50)),
                          child: const Text(
                            'Sign In',
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
