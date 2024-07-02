import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/consultation/quickViewPatients.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/datePicker.dart';
import 'package:nillq_doctor_app/screens/home/userProfile/userProfile.dart';
import 'package:nillq_doctor_app/services/fetchAppointmentsSchedules.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        scrolledUnderElevation: 0.0,
        elevation: 5.0,
        title: SafeArea(
          child: Text(
            'NillQ',
            style: TextStyle(
              color: Colors.grey[800],
              letterSpacing: 1.0,
            ),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(right: screenSize.width * 0.04),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const UserProfile()));
                },
                child: const CircleAvatar(
                  backgroundColor: themeColor,
                  foregroundImage: AssetImage('assets/images/doctor.jpg'),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: screenSize.height * 0.01),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const DatePicker()));
          },
          backgroundColor: themeColor,
          child: const Icon(
            Icons.add,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.03,
            vertical: screenSize.height * 0.00),
        child: FutureBuilder(
            future: _futureSchedules,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                List<Map<String, String>> schedules = snapshot.data!;
                if (schedules.isEmpty) {
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
                        return ScheduleTiles(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const QuickViewPatinets()));
                          },
                          time: schedules[index]['time']!,
                          totalTokens: schedules[index]['totalTokens']!,
                          bookedTokens: schedules[index]['bookedTokens']!,
                        );
                      });
                }
              }
            }),
      ),
    );
  }
}
