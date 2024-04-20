import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Map<String, String>>> fetchPatients() async {
  String jsonString =
      await rootBundle.loadString('assets/dummyData/patients.json');
  List<dynamic> jsonList = json.decode(jsonString);
  List<Map<String, String>> fetchedPatients = jsonList.map((item) {
    Map<String, dynamic> patient = Map<String, dynamic>.from(item);
    patient['age'] = patient['age'].toString(); // Convert age to string
    return Map<String, String>.from(patient);
  }).toList();
  return fetchedPatients;
}
