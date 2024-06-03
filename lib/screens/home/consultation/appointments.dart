import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/consultation/patientDetail.dart';
import 'package:nillq_doctor_app/services/fetchPatients.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class Appointmnets extends StatefulWidget {
  const Appointmnets({super.key});

  @override
  State<Appointmnets> createState() => _AppointmnetsState();
}

class _AppointmnetsState extends State<Appointmnets> {
  late Future<List<Map<String, String>>> _futureAppointments;

  @override
  void initState() {
    super.initState();
    _futureAppointments = fetchPatients();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(
          'Patients',
          style: appbarStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.03,
            vertical: screenSize.height * 0.0),
        child: FutureBuilder(
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
                List<Map<String, String>> patinets = snapshot.data!;
                if (patinets.length == 0) {
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
                      itemCount: patinets.length,
                      itemBuilder: (context, index) {
                        return CustomTileForAppointments(
                            name: patinets[index]['name']!,
                            age: patinets[index]['age']!,
                            gender: patinets[index]['gender']!,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PatientDetail(
                                          patientDetails: patinets[index])));
                            },
                            time: patinets[index]['time']!);
                      });
                }
              }
            }),
      ),
    );
  }
}
