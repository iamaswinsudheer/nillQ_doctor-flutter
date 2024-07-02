import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/timeSlots.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final _config = CalendarDatePicker2Config(
      disableMonthPicker: true,
      calendarType: CalendarDatePicker2Type.multi,
      selectedDayHighlightColor: themeColor,
      centerAlignModePicker: true,
      controlsTextStyle: TextStyle(
          color: Colors.grey[800], fontSize: 16.0, fontWeight: FontWeight.bold),
      firstDate: DateTime.now());

  List<DateTime> pickedDates = [];
  List<String> formattedPickedDates = [];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
        child: Column(children: [
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                  child: Text(
                'Pick your available dates : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              CalendarDatePicker2(
                config: _config,
                value: pickedDates,
                onValueChanged: (dates) => setState(() {
                  pickedDates = dates;
                }),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimeSlots(
                                    selectedDates: pickedDates,
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        minimumSize: const Size.fromHeight(50),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
