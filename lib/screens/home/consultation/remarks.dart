import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/animatedCheck.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class Remarks extends StatefulWidget {
  const Remarks({super.key});

  @override
  State<Remarks> createState() => _PatientRemarksState();
}

class _PatientRemarksState extends State<Remarks> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: screenSize.width * 0.04),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimatedCheck(
                                message: 'Consultation completed')));
                  },
                  icon: Icon(
                    Icons.check,
                    color: themeColor,
                    size: 40.0,
                  )))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          children: [
            Expanded(
                child: TextFormField(
              cursorColor: Colors.grey,
              autofocus: true,
              maxLines: 100,
              decoration:
                  InputDecoration.collapsed(hintText: 'Docotr\'s remark'),
            ))
          ],
        ),
      ),
    );
  }
}
