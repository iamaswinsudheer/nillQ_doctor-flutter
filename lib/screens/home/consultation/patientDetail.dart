import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class PatientDetail extends StatefulWidget {
  final Map<String, String> patientDetails;
  const PatientDetail({super.key, required this.patientDetails});

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: PatientDetailScreen(patientDetails: widget.patientDetails));
  }
}
