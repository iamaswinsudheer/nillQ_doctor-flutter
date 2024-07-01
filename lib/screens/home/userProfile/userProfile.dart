import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/settings.dart';
import 'package:nillq_doctor_app/services/fetchDoctor.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<Map<String, dynamic>> _futureDoctorDetails;

  @override
  void initState() {
    super.initState();
    _futureDoctorDetails = fetchDoctor();
  }

  String calculateAge(String dateOfBirth) {
    // Parse the date of birth string to a DateTime object
    DateTime dob = DateTime.parse(dateOfBirth);
    // Get the current date
    DateTime today = DateTime.now();

    // Calculate the age
    int age = today.year - dob.year;

    // Adjust the age if the current date is before the birthday this year
    if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
      age--;
    }

    return age.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Settings()));
                },
                icon: const Icon(
                  Icons.settings,
                ))
          ],
        ),
        body: FutureBuilder(
            future: _futureDoctorDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(themeColor),),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else {
                Map<String, dynamic> docDetails = snapshot.data!;
                final String link = docDetails['photo_Url'];
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.04,
                      vertical: screenSize.height * 0.02),
                  child: ListView(
                    children: [
                      Center(
                        child: Stack(children: [
                           CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(link)
                          ),
                          Positioned(
                              bottom: 1,
                              right: 1,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.photo_camera,
                                    color: themeColor,
                                    size: 35.0,
                                  )))
                        ]),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.03,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${docDetails['first_name']} ${docDetails['last_name']}',
                            style: TextStyle(
                                fontSize: 23.0,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.03,
                                vertical: screenSize.height * 0.01),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20.0))),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Age  :  ",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold)),
                              TextSpan(

                                  text: calculateAge(docDetails['date_of_birth']),
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ))
                            ])),
                          ),
                          SizedBox(
                            width: screenSize.width * 0.03,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.03,
                                vertical: screenSize.height * 0.01),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20.0))),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Experience  :  ",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: docDetails['experience'].toString(),
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ))
                            ])),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Divider(
                        height: screenSize.height * 0.05,
                      ),
                      Text(
                        'Phone number',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['phone_number'].toString()!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['email']!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      Divider(
                        height: screenSize.height * 0.05,
                      ),
                      Text(
                        'degrees',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['degrees']!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Text(
                        'Register number',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['registration_number']!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Text(
                        'Year of registration',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['year_of_registration'].toString()!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Text(
                        'State medical council',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['state_medical_council']!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      Divider(
                        height: screenSize.height * 0.05,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['address']!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Text(
                        'City',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['city']!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Text(
                        'Zip code',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['zip_code'].toString()!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Text(
                        'State',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['state']!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      Text(
                        'Country',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        docDetails['country']!,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
