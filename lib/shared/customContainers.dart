import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter/gestures.dart';

//Tiles for listing appointment schedule in home screen
class ScheduleTiles extends StatelessWidget {
  final String time;
  final String totalTokens;
  final String bookedTokens;
  final VoidCallback onTap;
  ScheduleTiles(
      {required this.time,
      required this.totalTokens,
      required this.bookedTokens,
      required this.onTap
      });

  final List<Color> tileBgColors = [
    Color.fromARGB(255, 84, 124, 225),
    Color.fromARGB(255, 5, 184, 169),
    Color.fromARGB(255, 130, 132, 130),
    Color.fromARGB(255, 192, 108, 6)
  ];

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.17,
      decoration: BoxDecoration(
          color: tileBgColors[int.parse(bookedTokens) % 4],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      margin: EdgeInsets.only(top: screenSize.height * 0.01),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              screenSize.width * 0.05,
              screenSize.height * 0.02,
              screenSize.width * 0.0,
              screenSize.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        time,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry>[
                        PopupMenuItem(
                            child: Text(
                          'Reschedule',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16.0),
                        )),
                        PopupMenuItem(
                            child: Text(
                          'Cancel',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16.0),
                        )),
                        PopupMenuItem(
                            child: Text(
                          'Delete',
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16.0),
                        )),
                      ];
                    }),
              ]),
              Text(
                'Total tokens : $totalTokens',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Booked tokens : $bookedTokens',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//custom container for scheduled appointmnets in appointment
class TilesForSchedule extends StatelessWidget {
  final String time;
  final String totalTokens;
  final String bookedTokens;
  final VoidCallback onTap;
  TilesForSchedule(
      {required this.time,
      required this.totalTokens,
      required this.bookedTokens,
      required this.onTap});

  final List<Color> tileBgColors = [
    Color.fromARGB(255, 84, 124, 225),
    Color.fromARGB(255, 5, 184, 169),
    Color.fromARGB(255, 130, 132, 130),
    Color.fromARGB(255, 192, 108, 6)
  ];

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.17,
      decoration: BoxDecoration(
          color: tileBgColors[int.parse(bookedTokens) % 4],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      margin: EdgeInsets.only(top: screenSize.height * 0.01),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.02,
              horizontal: screenSize.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  time,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                'Total tokens : $totalTokens',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Booked tokens : $bookedTokens',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//custom tile for today's appointments displayed in home screen
class CustomTileForAppointments extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String time;
  final VoidCallback onTap;

  CustomTileForAppointments(
      {required this.name,
      required this.age,
      required this.gender,
      required this.onTap,
      required this.time});

  final List<Color> tileBgColors = [
    Color.fromARGB(255, 84, 124, 225),
    Color.fromARGB(255, 5, 184, 169),
    Color.fromARGB(255, 130, 132, 130),
    Color.fromARGB(255, 192, 108, 6)
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.17,
      decoration: BoxDecoration(
          color: tileBgColors[int.parse(age) % 4],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      margin: EdgeInsets.only(top: screenSize.height * 0.01),
      child: InkWell(
        onTap: onTap,
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.02,
                horizontal: screenSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: screenSize.width * 0.5),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.01,
                                  ),
                                  Text(
                                    time,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                Text(
                  gender,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '$age years old',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

// //custom tile for scheduled appointments displayed in schedule appointments screen
// class CustomCardforScheduledAppointments extends StatelessWidget {
//   final String days;
//   final String timeSlots;
//   final VoidCallback rescheduleTap;
//   final VoidCallback viewTap;
//   CustomCardforScheduledAppointments(
//       {required this.days,
//       required this.timeSlots,
//       required this.rescheduleTap,
//       required this.viewTap});

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return Container(
//       padding: EdgeInsets.symmetric(
//           horizontal: screenSize.width * 0.03,
//           vertical: screenSize.height * 0.02),
//       margin: EdgeInsets.symmetric(
//           horizontal: screenSize.width * 0.04,
//           vertical: screenSize.height * 0.01),
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.all(Radius.circular(10.0))),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Days : ',
//             style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.grey[800],
//                 fontWeight: FontWeight.bold),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//           ),
//           Text(
//             days,
//             style: TextStyle(color: Colors.grey[700]),
//           ),
//           SizedBox(
//             height: screenSize.height * 0.01,
//           ),
//           Text(
//             'TimeSlots :',
//             style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.grey[800],
//                 fontWeight: FontWeight.bold),
//           ),
//           Text(
//             timeSlots,
//             style: TextStyle(color: Colors.grey[700]),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//           ),
//           Divider(
//             height: screenSize.height * 0.03,
//           ),
//           Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 height: screenSize.height * 0.05,
//                 child: ElevatedButton(
//                   onPressed: rescheduleTap,
//                   child: Text(
//                     'Reschedule',
//                     style: TextStyle(color: Colors.white, fontSize: 16.0),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(),
//                       primary: themeColor,
//                       minimumSize: const Size.fromHeight(50.0)),
//                 ),
//               )),
//           SizedBox(
//             height: screenSize.height * 0.01,
//           ),
//           Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 height: screenSize.height * 0.05,
//                 child: ElevatedButton(
//                   onPressed: viewTap,
//                   child: Text(
//                     'View',
//                     style: TextStyle(color: Colors.white, fontSize: 16.0),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(),
//                       primary: themeColor,
//                       minimumSize: const Size.fromHeight(50.0)),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }

//custom container for showing patient's previous reports

class CustomContainerForReports extends StatelessWidget {
  final String doctorName;
  final String hospital;
  final String remark;

  CustomContainerForReports(
      {required this.doctorName, required this.hospital, required this.remark});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.03,
          vertical: screenSize.height * 0.02),
      margin: EdgeInsets.only(bottom: screenSize.height * 0.01),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctorName,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            hospital,
            style: TextStyle(color: Colors.grey[800]),
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          Text(
            remark,
            style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
          )
        ],
      ),
    );
  }
}

//custom container for time picker
class CustomContainerForTimePicker extends StatefulWidget {
  final void Function(String startTime, String endTime, String noOfTokens)
      onTap;
  final VoidCallback onClose;

  CustomContainerForTimePicker({required this.onTap, required this.onClose});

  @override
  State<CustomContainerForTimePicker> createState() =>
      _CustomContainerForTimePickerState();
}

class _CustomContainerForTimePickerState
    extends State<CustomContainerForTimePicker> {
  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat('hh:mm a').format(dateTime);
  }

  bool selectedStartTime = false;

  bool selectedEndTime = false;

  TimeOfDay startTime = TimeOfDay.now();

  TimeOfDay endTime = TimeOfDay.now();

  late String formattedStartTime;

  late String formattedEndTime;

  TextEditingController _tokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(screenSize.width * 0.04,
                      screenSize.height * 0.02, 0.0, 0.0),
                  child: Text('Choose your available time slot',
                      style:
                          TextStyle(color: Colors.grey[800], fontSize: 18.0)),
                ),
              ),
              IconButton(
                  onPressed: widget.onClose,
                  icon: Icon(
                    Icons.close,
                    color: Colors.red,
                  ))
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            child: Row(
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
                      final TimeOfDay? pickedStartTime = await showTimePicker(
                          context: context, initialTime: startTime);

                      if (pickedStartTime != null) {
                        setState(() {
                          formattedStartTime = formatTimeOfDay(pickedStartTime);
                          selectedStartTime = true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor : themeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                    child: Text(
                      'Choose',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ))
              ],
            ),
          ),
          selectedStartTime
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
                  child: Text(
                    formattedStartTime,
                    style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  ),
                )
              : Container(),
          SizedBox(
            height: screenSize.height * 0.04,
          ),
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
              child: Divider()),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            child: Row(
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                    onPressed: () async {
                      final TimeOfDay? pickedEndTime = await showTimePicker(
                          context: context, initialTime: endTime);

                      if (pickedEndTime != null) {
                        setState(() {
                          formattedEndTime = formatTimeOfDay(pickedEndTime);
                          selectedEndTime = true;
                        });
                      }
                    },
                    child: Text(
                      'Choose',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ))
              ],
            ),
          ),
          selectedEndTime
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
                  child: Text(
                    formattedEndTime,
                    style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  ),
                )
              : Container(),
          SizedBox(
            height: screenSize.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Number of tokens',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: 50.0,
                  child: TextFormField(
                    controller: _tokenController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintText: 'No of tokens',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: themeColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: themeColor))),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.04,
          ),
          SizedBox(
            height: 45.0,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
              child: ElevatedButton(
                  onPressed: () {
                    if (selectedStartTime & selectedEndTime) {
                      widget.onTap(formattedStartTime, formattedEndTime,
                          _tokenController.text);
                    }
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
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.03,
          )
        ],
      ),
    );
  }
}

//custom tile for listing selected timeslots
class CustomTileForSelectedTimeSlots extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String tokens;
  final VoidCallback onTap;

  CustomTileForSelectedTimeSlots(
      {required this.startTime,
      required this.endTime,
      required this.onTap,
      required this.tokens});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: screenSize.height * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.04,
          vertical: screenSize.height * 0.01),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Time slot added ',
                      style:
                          TextStyle(color: Colors.grey[800], fontSize: 16.0)),
                  WidgetSpan(
                      child: Icon(
                    Icons.check,
                    color: Colors.green,
                  ))
                ]),
              )),
              IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
          Row(
            children: [
              Text(
                'Start time : $startTime,',
                style: TextStyle(color: Colors.grey[800]),
              ),
              SizedBox(
                width: screenSize.width * 0.02,
              ),
              Text(
                'End time : $endTime',
                style: TextStyle(color: Colors.grey[800]),
              )
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          Text(
            'Tokens : $tokens',
            style: TextStyle(color: Colors.grey[800]),
          )
        ],
      ),
    );
  }
}


//screen for showing patient details
class PatientDetailScreen extends StatelessWidget{
  final patientDetails;
  PatientDetailScreen({required this.patientDetails});

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.01),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Text(
                  patientDetails['name']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  patientDetails['gender']!,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Center(
                child: Container(
                  height: 55.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            '${patientDetails['age']!} Years',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      SizedBox(
                        width: screenSize.width * 0.1,
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1.0,
                        indent: 10.0,
                        endIndent: 10.0,
                      ),
                      SizedBox(
                        width: screenSize.width * 0.05,
                      ),
                      Column(
                        children: [
                          Text(
                            'Blood group',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            patientDetails['blood_group']!,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenSize.height * 0.03),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Token number',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 16.0),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            Text(
                              patientDetails['token']!,
                              style: TextStyle(
                                  color: themeColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.05,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Approximate time',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 16.0),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            Text(
                              patientDetails['approxTime']!,
                              style: TextStyle(
                                  color: themeColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Text(
                patientDetails['reason']!,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Text(
                patientDetails['symptoms']!,
                style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'View patient\'s medications. ',
                    style: TextStyle(color: Colors.grey[800], fontSize: 16.0)),
                TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: 'View',
                    style: TextStyle(color: themeColor, fontSize: 16.0))
              ])),
              SizedBox(height: screenSize.height * 0.15,)
            ],
          ),
        );
  }
}
