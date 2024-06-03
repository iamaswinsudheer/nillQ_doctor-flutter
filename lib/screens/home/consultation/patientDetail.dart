import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class PatientDetail extends StatefulWidget {
  final Map<String, String> patientDetails;
  const PatientDetail({super.key, required this.patientDetails});

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.01),
          child: ListView(
            children: <Widget>[
              Center(
                child: Text(
                  widget.patientDetails['name']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  widget.patientDetails['gender']!,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Center(
                child: Container(
                  height: 55.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            '${widget.patientDetails['age']!} Years',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      SizedBox(
                        width: screenSize.width * 0.1,
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1.0,
                        indent: 10.0,
                        endIndent: 10.0,
                      ),
                      SizedBox(
                        width: screenSize.width * 0.05,
                      ),
                      Column(
                        children: [
                          Text(
                            'Blood group',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            widget.patientDetails['blood_group']!,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenSize.height * 0.03),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Token number',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 16.0),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            Text(
                              widget.patientDetails['token']!,
                              style: TextStyle(
                                  color: themeColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.05,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Approximate time',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 16.0),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            Text(
                              widget.patientDetails['approxTime']!,
                              style: TextStyle(
                                  color: themeColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Text(
                widget.patientDetails['reason']!,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Text(
                widget.patientDetails['symptoms']!,
                style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'View patient\'s medications. ',
                    style: TextStyle(color: Colors.grey[800], fontSize: 16.0)),
                TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: 'View',
                    style: TextStyle(color: themeColor, fontSize: 16.0))
              ]))
            ],
          ),
        ));
  }
}
