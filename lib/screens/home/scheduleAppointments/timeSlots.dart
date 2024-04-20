import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/animatedCheck.dart';
import 'package:nillq_doctor_app/services/generateTimeSlots.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';

class TimeSlots extends StatefulWidget {
  const TimeSlots({super.key});

  @override
  State<TimeSlots> createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlots> {
  int timePickerCount = 1;
  List<Map<String, String>> timeslots = [];
  List<List<String>> generatedTimeSlots = [];

  Map<String, String> addTimesToJson(
      String formattedStartTime, String formattedEndTime) {
    return {'start_time': formattedStartTime, 'end_time': formattedEndTime};
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        actions: [
          timePickerCount == 0
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      timePickerCount += 1;
                    });
                  },
                  icon: Padding(
                    padding: EdgeInsets.only(right: screenSize.width * 0.02),
                    child: Icon(
                      Icons.add,
                      size: 30.0,
                      color: themeColor,
                    ),
                  ))
              : Container()
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.02,
            vertical: screenSize.height * 0.01),
        child: Column(children: [
          Expanded(
            child: ListView(children: [
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 0.0),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: timeslots.length,
                    itemBuilder: (context, index) {
                      return CustomTileForSelectedTimeSlots(
                          onTap: () {
                            setState(() {
                              timeslots.removeAt(index);
                            });
                          },
                          startTime: timeslots[index]['start_time']!,
                          endTime: timeslots[index]['end_time']!);
                    }),
              ),
              timeslots.length == 0
                  ? SizedBox()
                  : SizedBox(
                      height: screenSize.height * 0.02,
                    ),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 1.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: timePickerCount,
                    itemBuilder: (context, index) {
                      return CustomContainerForTimePicker(
                        onClose: () {
                          setState(() {
                            timePickerCount -= 1;
                          });
                        },
                        onTap: (formattedStartTime, formattedEndTime) {
                          setState(() {
                            timeslots.add(addTimesToJson(
                                formattedStartTime, formattedEndTime));
                            timePickerCount -= 1;
                          });
                        },
                      );
                    }),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.005),
            child: ElevatedButton(
                onPressed: () {
                  print(timeslots);
                  for (int i = 0; i < timeslots.length; i++) {
                    generatedTimeSlots.add(splitTimeRange(
                        timeslots[i]['start_time']!,
                        timeslots[i]['end_time']!));
                  }
                  print(generatedTimeSlots);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimatedCheck(
                                message:
                                    "Appointment schedule added successfully.",
                              )));
                },
                style: ElevatedButton.styleFrom(
                  primary: themeColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white, fontSize: 18.0, letterSpacing: 1.0),
                )),
          )
        ]),
      ),
    );
  }
}
