import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentHistory extends StatefulWidget {
  const AppointmentHistory({super.key});

  @override
  State<AppointmentHistory> createState() => _AppointmentHistoryState();
}

class _AppointmentHistoryState extends State<AppointmentHistory> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: ListView(children: [
        TableCalendar(
          availableGestures: AvailableGestures.horizontalSwipe,
          locale: 'en_US',
          calendarFormat: _calendarFormat,
          firstDay: DateTime.utc(2000, 1, 01),
          lastDay: DateTime.now(),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            isTodayHighlighted: true,
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pink[200],
            ),
            selectedDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: themeColor,
            ),
            defaultDecoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            weekendDecoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
              formatButtonVisible: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0)),
              formatButtonPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              formatButtonTextStyle:
                  TextStyle(color: Colors.black, letterSpacing: 1.0)),
        ),
      ]),
    );
  }
}