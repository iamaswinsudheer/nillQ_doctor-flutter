import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(themeColor)),
      ),
    );
  }
}
