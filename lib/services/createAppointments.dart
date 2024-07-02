import 'package:http/http.dart' as http;
import 'package:nillq_doctor_app/services/docIdManager.dart';

class Appointments {
  Future<dynamic> createAppointments(
      List<DateTime> dates, List<Map<String, dynamic>> timeSlots) async {
    DocIdManager docIdManager = DocIdManager();
    String api = '';
    String doctorId = await docIdManager.readDocId();
    print(dates);
    print(timeSlots);
    Map<String, dynamic> requestBody = {
      'doc_id': doctorId,
      'dates': dates,
      'time_slots': timeSlots,
    };
    print(requestBody);
    try {
      final response = await http.post(Uri.parse(api), body: requestBody);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
