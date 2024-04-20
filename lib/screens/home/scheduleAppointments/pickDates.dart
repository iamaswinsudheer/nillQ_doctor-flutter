import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/timeSlots.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class PickDates extends StatefulWidget {
  const PickDates({super.key});

  @override
  State<PickDates> createState() => _PickDatesState();
}

class _PickDatesState extends State<PickDates> {
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your appointment window',
              style: TextStyle(
                // color: themeColor,
                color: Colors.grey[800],
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: screenSize.height * 0.04,),
            TextFormField(
              controller: startDateController,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[800]!)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[800]!),
                ),
                icon: Icon(
                  Icons.calendar_today,
                  color: themeColor,
                ),
                labelText: "Start date",
                labelStyle: TextStyle(color: Colors.grey[800]),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  print('formatted date : $formattedDate');
                  setState(() {
                    startDateController.text = formattedDate;
                  });
                }
              },
            ),
            Divider(
              height: screenSize.height * 0.08,
            ),
            TextFormField(
              controller: endDateController,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]!)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[800]!),
                  ),
                  icon: Icon(
                    Icons.calendar_today,
                    color: themeColor,
                  ),
                  labelText: "End date",
                  labelStyle: TextStyle(color: Colors.grey[800])),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  print('formatted date : $formattedDate');
                  setState(() {
                    endDateController.text = formattedDate;
                  });
                }
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TimeSlots()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: themeColor,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
