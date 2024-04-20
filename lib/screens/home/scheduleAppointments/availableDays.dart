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
  bool _isToday = false;
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
            horizontal: screenSize.width * 0.01),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: ListView(
                children: [
                  CheckboxListTile(
                      title: Text(
                        'Today',
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 18.0),
                      ),
                      activeColor: themeColor,
                      value: _isToday,
                      onChanged: (_) {
                        setState(() {
                          _isToday = !_isToday;
                        });
                      }),
                  Divider(
                    color: Colors.grey[600],
                    thickness: 0.5,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PickDates()));
                    },
                    title: Text(
                      'Pick dates',
                      style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
                    ),
                  ),
                  Divider(
                    color: Colors.grey[600],
                    thickness: 0.5,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomDates()));
                    },
                    title: Text(
                      'Custom dates',
                      style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
                    ),
                  ),
                  Divider(
                    color: Colors.grey[600],
                    thickness: 0.5,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
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
                      primary: themeColor,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
