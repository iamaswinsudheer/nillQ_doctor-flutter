import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Map<String, String>>> fetchTimeSlots() async {
  String jsonString =
      await rootBundle.loadString('assets/dummyData/timeSlots.json');
  List<dynamic> jsonList = json.decode(jsonString);
  List<Map<String, String>> fetchedTimeSlots =
      jsonList.map((item) => Map<String, String>.from(item)).toList();
  return fetchedTimeSlots;
}
