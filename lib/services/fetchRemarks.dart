import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Map<String, String>>> fetchRemarks() async {
  String jsonString =
      await rootBundle.loadString('assets/dummyData/remarks.json');
  List<dynamic> jsonList = json.decode(jsonString);
  List<Map<String, String>> fetchedRemarks =
      jsonList.map((item) => Map<String, String>.from(item)).toList();
  return fetchedRemarks;
}
