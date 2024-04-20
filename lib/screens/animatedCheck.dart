import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/bottomNavBar.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class AnimatedCheck extends StatefulWidget {
  final String message;
  AnimatedCheck({required this.message});

  @override
  _AnimatedCheckState createState() => _AnimatedCheckState();
}

class _AnimatedCheckState extends State<AnimatedCheck>
    with TickerProviderStateMixin {
  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.easeIn);

  bool isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimationCompleted = true;
        });
        Timer(Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar()),
              (route) => false);
        });
      }
    });
    scaleController.forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double circleSize = 150;
    double iconSize = 100;
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ScaleTransition(
          scale: scaleAnimation,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: circleSize,
              width: circleSize,
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child:
                      Icon(Icons.check, color: Colors.white, size: iconSize)),
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        isAnimationCompleted
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Container(),
      ]),
    );
  }
}
