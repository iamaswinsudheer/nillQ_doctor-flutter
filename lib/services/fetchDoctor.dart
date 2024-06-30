import 'package:flutter/services.dart';
import 'package:nillq_doctor_app/services/docIdManager.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'networkConfig.dart';

DocIdManager id = new DocIdManager();

Future<Map<String, dynamic>> fetchDoctor() async {
    String Docid = await id.readDocId();
    String api = "http://$ip:7000/api/doctors/get-data-doctor";
    try{
      final response = await http.get(Uri.parse(api), headers: {"id": Docid});
      if(response.statusCode == 200){
        return json.decode(response.body);
      }else{
        throw Exception('Failed to load doctor');
      }
     }catch(e){
      throw Exception(e);
    }
}
