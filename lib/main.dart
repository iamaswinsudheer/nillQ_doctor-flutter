import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/authentication/login.dart';
import 'package:nillq_doctor_app/wrapper.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
