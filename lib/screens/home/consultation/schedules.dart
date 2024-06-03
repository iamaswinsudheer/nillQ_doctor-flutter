import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/consultation/appointments.dart';
import 'package:nillq_doctor_app/services/fetchAppointmentsSchedules.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class AppointmentSchedules extends StatefulWidget {
  const AppointmentSchedules({super.key});

  @override
  State<AppointmentSchedules> createState() => _AppointmentSchedulesState();
}

class _AppointmentSchedulesState extends State<AppointmentSchedules> {
  late Future<List<Map<String, String>>> _futureSchedules;

  @override
  void initState() {
    super.initState();
    _futureSchedules = fetchAppointmentSchedules();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        scrolledUnderElevation: 0.0,
        title: Text(
          'Schedules',
          style: TextStyle(
            color: Colors.grey[800],
            // letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.03,
            vertical: screenSize.height * 0.00),
        child: FutureBuilder(
            future: _futureSchedules,
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
                List<Map<String, String>> schedules = snapshot.data!;
                if (schedules.length == 0) {
                  return Center(
                    child: Text(
                      'No scheduled appointments',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16.0,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: schedules.length,
                      itemBuilder: (context, index) {
                        return TilesForSchedule(
                            time: schedules[index]['time']!,
                            totalTokens: schedules[index]['totalTokens']!,
                            bookedTokens: schedules[index]['bookedTokens']!,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Appointmnets()));
                            });
                      });
                }
              }
            }),
      ),
    );
  }
}
