import 'package:intl/intl.dart';

List<String> splitTimeRange(String startTime, String endTime) {
  DateFormat format = DateFormat("hh:mm a");
  DateTime startDateTime = format.parse(startTime);
  DateTime endtDateTime = format.parse(endTime);

  List<String> timeSlots = [];

  DateTime currentTime = startDateTime;

  while (currentTime.isBefore(endtDateTime)) {
    timeSlots.add(format.format(currentTime));
    currentTime = currentTime.add(Duration(minutes: 30));
  }
  return timeSlots;
}
