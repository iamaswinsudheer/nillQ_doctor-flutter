import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Map<String, String>>> fetchAppointmentSchedules() async {
  String jsonString =
      await rootBundle.loadString('assets/dummyData/appointmentSchedules.json');
  List<dynamic> jsonList = json.decode(jsonString);
  List<Map<String, String>> fetchedAppointmentSchedules =
      jsonList.map((item) => Map<String, String>.from(item)).toList();
  return fetchedAppointmentSchedules;
}
