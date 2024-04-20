import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/availableDays.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/detailAppointments.dart';
import 'package:nillq_doctor_app/services/fetchScheduledAppointments.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class ScheduleAppointments extends StatefulWidget {
  const ScheduleAppointments({super.key});

  @override
  State<ScheduleAppointments> createState() => _ScheduleAppointmentsState();
}

class _ScheduleAppointmentsState extends State<ScheduleAppointments> {
  late Future<List<Map<String, String>>> _futureAppointments;
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    _futureAppointments = fetchScheduledAppointments();
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Text(
            'Schedule appointments',
            style: appbarStyle,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SelectDays()));
        },
        backgroundColor: themeColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder(
          future: _futureAppointments,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              List<Map<String, String>> appointments = snapshot.data!;
              if (appointments.length == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/images/empty-box.png',
                      height: 150.0,
                      width: 150.0,
                    )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'You don\'t have any scheduled availabilities',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                    )
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: appointments.length,
                    itemBuilder: (context, index) {
                      return CustomCardforScheduledAppointments(
                          rescheduleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectDays()));
                          },
                          viewTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailAppoinmnets(
                                        appointments: appointments[index])));
                          },
                          days: appointments[index]['customDays']!.length == 0
                              ? '${appointments[index]['fromDate']} to ${appointments[index]['endDate']}'
                              : appointments[index]['customDays']!,
                          timeSlots: appointments[index]['timeSlots']!);
                    });
              }
            }
          }),
    );
  }
}
