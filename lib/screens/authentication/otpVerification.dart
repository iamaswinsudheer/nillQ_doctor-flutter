import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:nillq_doctor_app/wrapper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  final String verificationId;
  const OtpVerification({super.key, required this.verificationId});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final _formKey = GlobalKey<FormState>();
  var otp = '';
  TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('verification code: ${widget.verificationId}');
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: SafeArea(
            child: Text(
              'Phone Verification',
              style: TextStyle(
                  color: themeColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0.0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.05,
                  horizontal: screenSize.width * 0.07),
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Verify your phone number.',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.015,
                        ),
                        Text(
                          'Enter 4 digit verification code send to your mobile number',
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.grey[900]),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.07,
                        ),
                        PinCodeTextField(
                          controller: _otpController,
                          appContext: context,
                          length: 6,
                          onCompleted: (value) => print(value),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          autoDismissKeyboard: true,
                          cursorColor: themeColor,
                          pinTheme: PinTheme(
                              activeColor: themeColor,
                              selectedColor: themeColor,
                              inactiveColor: themeColor),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.1,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              print('button clicked');
                              print(_otpController.text);
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: widget.verificationId,
                                      smsCode: _otpController.text);
                              try {
                                await FirebaseAuth.instance
                                    .signInWithCredential(credential)
                                    .then((value) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Wrapper()),
                                      (route) => false);
                                });
                              } on FirebaseAuthException catch (exception) {
                                print(exception);
                              } catch (exception) {
                                print('exception from catch: $exception');
                              }
                            },
                            child: Text(
                              'Verify OTP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: themeColor,
                                minimumSize: const Size.fromHeight(50))),
                      ]))),
        ));
  }
}
