import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/authentication/phoneNumber.dart';
import 'package:nillq_doctor_app/screens/home/bottomNavBar.dart';
import 'package:nillq_doctor_app/screens/loadingScreen.dart';
import 'package:nillq_doctor_app/services/saveToken.dart';
import 'package:nillq_doctor_app/services/userAuthentication.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  Authentication authentication = new Authentication();
  TokenManager tokenManager = new TokenManager();
  late String loginId;
  late String password;
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return _isLoading
        ? LoadingIndicator()
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: screenSize.width,
                padding: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.08,
                    horizontal: screenSize.width * 0.1),
                child: SafeArea(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
                                  Text(
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
                                  FittedBox(
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
                            height: screenSize.height * 0.05,
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
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom *
                                        1.2),
                            decoration: textInputDecorationWithTheme.copyWith(
                                hintText: 'Enter your login id',
                                hintStyle: TextStyle(color: Colors.grey[500])),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.03,
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
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom *
                                        1.2),
                            decoration: textInputDecorationWithTheme.copyWith(
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(color: Colors.grey[500])),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.03,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                print(
                                    'login id: $loginId, password: $password');
                                try {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  Map<String, dynamic> token =
                                      await authentication.login(
                                          loginId, password);
                                  print(token);
                                  await tokenManager
                                      .saveToken(token['Token'].toString());
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BottomNavBar()),
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
                                          title: Text('Login failed'),
                                          content: Text(
                                              'Login attempt failed, please try again.'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Ok'))
                                          ],
                                        );
                                      });
                                }
                              }
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                primary: themeColor,
                                minimumSize: const Size.fromHeight(50)),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.05,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Divider(
                                thickness: 1.5,
                                color: Colors.grey,
                              )),
                              SizedBox(
                                width: screenSize.width * 0.03,
                              ),
                              Center(
                                child: Text(
                                  'or sign in with',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.03,
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 1.5,
                                color: Colors.grey,
                              )),
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height * 0.04,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                try {
                                  final GoogleSignInAccount?
                                      googleSignInAccount =
                                      await googleSignIn.signIn();
                                  if (googleSignInAccount != null) {
                                    final GoogleSignInAuthentication
                                        googleSignInAuthentication =
                                        await googleSignInAccount
                                            .authentication;
                                    final AuthCredential credential =
                                        GoogleAuthProvider.credential(
                                            accessToken:
                                                googleSignInAuthentication
                                                    .accessToken,
                                            idToken: googleSignInAuthentication
                                                .idToken);
                                    final UserCredential authResult =
                                        await _auth
                                            .signInWithCredential(credential);
                                    final User? user = authResult.user;
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavBar()),
                                        (route) => false);
                                  }
                                  // GoogleAuthProvider _googleAuthProvider =
                                  //     GoogleAuthProvider();
                                  // _auth.signInWithProvider(_googleAuthProvider);
                                  // Navigator.pushAndRemoveUntil(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Wrapper()),
                                  //     (route) => false);
                                } catch (error) {
                                  print(error);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/google_icon.png',
                                    width: 15.0,
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.02,
                                  ),
                                  Text(
                                    'Sign in with google',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[700],
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: screenSize.height * 0.03,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GetPhoneNumber()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/phone-call.png',
                                    width: 15.0,
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.02,
                                  ),
                                  Text(
                                    'Sign in with phone number',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[700],
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
