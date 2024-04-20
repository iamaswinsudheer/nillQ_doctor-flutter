import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nillq_doctor_app/services/networkConfig.dart';

class UserRegistration {
  Future<Map<String, dynamic>> passUserDetails(
      // String? base64doc,
      // String? base64image,      
      String? firstName,
      String? lastName,
      String? phoneNumber,
      String? email,
      String? dob,
      String? degrees,
      String? registerNumber,
      String? yearOfRegistration,
      String? stateMedicalCouncil,
      String? experience,
      String? address,
      String? zipCode,
      String? city,
      String? state,
      String? country) async {
    String api = "http://$ip:7000/api/docs/doctorRegister";
    try {
      final response = await http.post(Uri.parse(api), body: {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "date_of_birth": dob,
        "degrees": degrees,
        "registration_number": registerNumber,
        "year_of_registration": yearOfRegistration,
        "state_medical_council": stateMedicalCouncil,
        "experience": experience,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "zip_code": zipCode
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> reply = jsonDecode(response.body);
        print(reply);
        return reply;
      } else {
        Map<String, dynamic> errorMessage = jsonDecode(response.body);
        print(errorMessage);
        throw Exception(errorMessage);
      }
    } catch (error) {
      print(error);
      throw Exception(error);
    }
  }
}
