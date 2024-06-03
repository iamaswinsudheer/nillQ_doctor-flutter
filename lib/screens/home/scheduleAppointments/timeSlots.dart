import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/animatedCheck.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:nillq_doctor_app/shared/customContainers.dart';
import 'package:intl/intl.dart';

class TimeSlots extends StatefulWidget {
  const TimeSlots({super.key});

  @override
  State<TimeSlots> createState() => _TimeSlotsState();
}

class _TimeSlotsState extends State<TimeSlots> {
  int timePickerCount = 1;
  List<Map<String, String>> timeslots = [];
  TimeOfDay startTime = TimeOfDay.now();
  String? formattedStartTime;
  String? formattedEndTime;
  // List<List<String>> generatedTimeSlots = [];

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat('hh:mm a').format(dateTime);
  }

  Map<String, String> addTimesToJson(
      String? formattedStartTime, String? formattedEndTime, String noOfTokens) {
    return {
      'start_time': formattedStartTime!,
      'end_time': formattedEndTime!,
      'no_of_tokens': noOfTokens
    };
  }

  late TextEditingController _tokenController;
  int tokens = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tokenController = TextEditingController()
      ..text = tokens.toString()
      ..selection = TextSelection.collapsed(offset: tokens.toString().length);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.02,
            vertical: screenSize.height * 0.01),
        child: Column(children: [
          Expanded(
            flex: 9,
            child: ListView(shrinkWrap: true, children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.03,
                    vertical: screenSize.height * 0.03),
                decoration: BoxDecoration(
                    // color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose your time slot',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Start time',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.normal),
                        )),
                        ElevatedButton(
                            onPressed: () async {
                              final TimeOfDay? pickedStartTime =
                                  await showTimePicker(
                                      context: context, initialTime: startTime);

                              if (pickedStartTime != null) {
                                setState(() {
                                  formattedStartTime =
                                      formatTimeOfDay(pickedStartTime);
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: themeColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                            child: Text(
                              'Choose',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ))
                      ],
                    ),
                    formattedStartTime == null
                        ? Container()
                        : Text('Start time : $formattedStartTime'),
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          'End time',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.normal),
                        )),
                        ElevatedButton(
                            onPressed: () async {
                              final TimeOfDay? pickedStartTime =
                                  await showTimePicker(
                                      context: context, initialTime: startTime);

                              if (pickedStartTime != null) {
                                setState(() {
                                  formattedEndTime =
                                      formatTimeOfDay(pickedStartTime);
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: themeColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                            child: Text(
                              'Choose',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ))
                      ],
                    ),
                    formattedEndTime == null
                        ? Container()
                        : Text('End time : $formattedEndTime'),
                    Divider(),
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Tokens',
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 18.0),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    tokens--;
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_downward,
                                )),
                            SizedBox(
                              width: screenSize.width * 0.1,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey[800]),
                                controller: _tokenController,
                                cursorColor: Colors.grey,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    tokens++;
                                  });
                                },
                                icon: Icon(Icons.arrow_upward))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            timeslots.add(addTimesToJson(formattedStartTime,
                                formattedEndTime, tokens.toString()));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: themeColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                        child: Text(
                          'Add time slot',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
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
                          tokens: timeslots[index]['no_of_tokens']!,
                          startTime: timeslots[index]['start_time']!,
                          endTime: timeslots[index]['end_time']!);
                    }),
              ),
            ]),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.height * 0.01,
                    vertical: screenSize.height * 0.01),
                child: ElevatedButton(
                    onPressed: () {
                      print(timeslots);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimatedCheck(
                                    message:
                                        "Appointment schedule added successfully.",
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 1.0),
                    )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
