import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Map<String, String>>> fetchScheduledAppointments() async {
  String jsonString =
      await rootBundle.loadString('assets/dummyData/scheduledAppointments.json');
  List<dynamic> jsonList = jsonDecode(jsonString);
  List<Map<String, String>> fetchedAppointments = jsonList.map((item) {
    Map<String, dynamic> appointmentsMap = Map<String, dynamic>.from(item);
    
    // Convert customDays list to comma-separated string
    List<String> customDays = List<String>.from(appointmentsMap['customDays']);
    appointmentsMap['customDays'] = customDays.join(', ');

    // Convert timeSlots list to comma-separated string
    List<String> timeSlots = List<String>.from(appointmentsMap['timeSlots']);
    appointmentsMap['timeSlots'] = timeSlots.join(', ');

    return appointmentsMap.cast<String, String>();
  }).toList();
  return fetchedAppointments;
}
