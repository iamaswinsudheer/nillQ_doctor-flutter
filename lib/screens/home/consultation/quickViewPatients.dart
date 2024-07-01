import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/services/fetchPatients.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class QuickViewPatinets extends StatefulWidget {
  const QuickViewPatinets({super.key});

  @override
  State<QuickViewPatinets> createState() => _QuickViewPatinetsState();
}

class _QuickViewPatinetsState extends State<QuickViewPatinets> {
  ScrollController scrollController = ScrollController();
  int patientIndex = 0;
  int patientCount = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(elevation: 0.0, scrolledUnderElevation: 0.0,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              if (patientIndex != 0) {
                setState(() {
                  patientIndex -= 1;
                });
              }
            },
            backgroundColor: patientIndex == 0 ? Colors.grey : themeColor,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: screenSize.width * 0.3,
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              if (patientIndex != (patientCount - 1)) {
                setState(() {
                  patientIndex += 1;
                });
              }
            },
            backgroundColor:
                patientIndex == (patientCount - 1) ? Colors.grey : themeColor,
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: FutureBuilder(
          future: fetchPatients(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong '),
              );
            } else {
              final patients = snapshot.data!;
              patientCount = patients.length;
              return PatientDetailScreen(patientDetails: patients[patientIndex]);
            }
          }),
    );
  }
}
