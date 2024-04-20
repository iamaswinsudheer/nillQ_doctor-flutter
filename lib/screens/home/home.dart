import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/consultation/patientDetail.dart';
import 'package:nillq_doctor_app/screens/home/scheduleAppointments/scheduleAppointments.dart';
import 'package:nillq_doctor_app/screens/home/userProfile/userProfile.dart';
import 'package:nillq_doctor_app/services/fetchPatients.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Map<String, String>>> _futurePatients;
  @override
  Widget build(BuildContext context) {
    _futurePatients = fetchPatients();
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
                      MaterialPageRoute(builder: (context) => UserProfile()));
                },
                child: CircleAvatar(
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ScheduleAppointments()));
          },
          backgroundColor: themeColor,
          child: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(screenSize.width * 0.01, 0.0,
            screenSize.width * 0.01, screenSize.height * 0.01),
        child: FutureBuilder(
            future: _futurePatients,
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
                List<Map<String, String>> patients = snapshot.data!;
                if (patients.length == 0) {
                  return Center(
                    child: Text(
                      'No booked appointments',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16.0,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: patients.length,
                      itemBuilder: (context, index) {
                        return CustomTileForAppointments(
                            name: patients[index]['name']!,
                            age: patients[index]['age']!,
                            gender: patients[index]['gender']!,
                            time: patients[index]['time']!,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PatientDetail(
                                          patientDetails: patients[index])));
                            });
                      });
                }
              }
            }),
      ),
    );
  }
}
