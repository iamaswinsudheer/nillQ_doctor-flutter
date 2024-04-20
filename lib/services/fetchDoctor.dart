import 'package:flutter/services.dart';
import 'dart:convert';

Future<Map<String, String>> fetchDoctor() async {
  String jsonString = await rootBundle
      .loadString('assets/dummyData/doctorDetails.json', cache: false);
  print('function worked');
  Map<String, dynamic> jsonMap = json.decode(jsonString);
  Map<String, String> fetchedDoctor =
      jsonMap.map((key, value) => MapEntry(key, value.toString()));
  return fetchedDoctor;
}
