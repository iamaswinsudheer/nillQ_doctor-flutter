import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/customDates.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/pickDates.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/timeSlots.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class SelectDays extends StatefulWidget {
  const SelectDays({super.key});

  @override
  State<SelectDays> createState() => _SelectDaysState();
}

class _SelectDaysState extends State<SelectDays> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose days',
          style: appbarStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.03),
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[800]!))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Today',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                                fontSize: 18.0),
                          )),
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: themeColor,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              })
                        ],
                      ),
                      Text(
                        'Schedule appointments for today',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[800]!))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PickDates()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Text(
                          'Pick dates',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Schedule appointments for a range of dates',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[800]!))),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomDates()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Text(
                          'Custom dates',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Customize dates for appointmnets',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.02,
                      vertical: screenSize.height * 0.01),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TimeSlots()));
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
