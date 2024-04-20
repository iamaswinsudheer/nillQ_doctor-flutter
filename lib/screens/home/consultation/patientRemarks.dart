import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/services/fetchRemarks.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class PatientRemarks extends StatefulWidget {
  const PatientRemarks({super.key});

  @override
  State<PatientRemarks> createState() => _PatientRemarksState();
}

class _PatientRemarksState extends State<PatientRemarks> {
  late Future<List<Map<String, String>>> _futureRemarks;
  @override
  Widget build(BuildContext context) {
    _futureRemarks = fetchRemarks();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
        child: FutureBuilder(
            future: _futureRemarks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong'),
                );
              } else {
                List<Map<String, String>> remarks = snapshot.data!;
                if (remarks.length == 0) {
                  return Container();
                } else {
                  return ListView.builder(
                      itemCount: remarks.length,
                      itemBuilder: (context, index) {
                        return CustomContainerForReports(
                            doctorName: remarks[index]['doctor_name']!,
                            hospital: remarks[index]['hospital_name']!,
                            remark: remarks[index]['remark']!);
                      });
                }
              }
            }),
      ),
    );
  }
}
