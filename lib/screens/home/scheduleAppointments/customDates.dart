import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/timeSlots.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class CustomDates extends StatefulWidget {
  const CustomDates({super.key});

  @override
  State<CustomDates> createState() => _CustomDatesState();
}

class _CustomDatesState extends State<CustomDates> {
  List<String> days = [
    'Every Sunday',
    'Every Monday',
    'Every Tuesday',
    'Every Wednesday',
    'Every Thursday',
    'Every Friday',
    'Every Saturday',
  ];
  final List<bool> _selectedDays = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                        activeColor: themeColor,
                        title: Text(days[index],
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 18.0)),
                        value: _selectedDays[index],
                        onChanged: (_) {
                          setState(() {
                            _selectedDays[index] = !_selectedDays[index];
                          });
                        });
                  })),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.02,
                vertical: screenSize.height * 0.02),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TimeSlots()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  minimumSize: const Size.fromHeight(50),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
