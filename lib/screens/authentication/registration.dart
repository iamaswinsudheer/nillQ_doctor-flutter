import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/home.dart';
import 'package:nillq_doctor_app/services/userRegistration.dart';
import 'package:nillq_doctor_app/shared/constants.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController firstNameController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController registerNumberController = TextEditingController();
  TextEditingController yearOfRegistrationController = TextEditingController();
  TextEditingController stateMedicalCouncilController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  bool fileChoosed = false;
  String? base64Certificate;
  String? base64Image;
  String? fileName;
  File? imageFile;
  bool openedPickerNullFile = false;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? registerNumber;
  String? dob;
  String? degrees;
  String? yearOfRegsitartion;
  String? stateMedicalCouncil;
  String? experience;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  final _formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  UserRegistration userRegistration = new UserRegistration();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        title: SafeArea(
            child: Text('Register to App',
                style: TextStyle(
                    color: themeColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold))),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.02,
            horizontal: screenSize.width * 0.05),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                'Fill in the following details to complete Registration.',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.grey[200],
                      foregroundImage:
                          imageFile != null ? FileImage(imageFile!) : null,
                      child: imageFile != null
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(themeColor))
                          : null,
                    ),
                    Positioned(
                      right: 1,
                      bottom: 1,
                      child: ElevatedButton(
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['jpg', 'png'],
                            );
                            if (result != null) {
                              setState(() {
                                imageFile = File(result.files.single.path!);
                              });
                              List<int> imageBytes =
                                  imageFile!.readAsBytesSync();
                              base64Image = base64Encode(imageBytes);
                              print(base64Image);
                            } else {
                              print('No file choosed');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(), primary: themeColor),
                          child: Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'First Name',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: themeColor),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      TextFormField(
                          controller: firstNameController,
                          onChanged: (value) {
                            setState(() {
                              firstName = firstNameController.text;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "First name required";
                            } else {
                              return null;
                            }
                          },
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Enter first name',
                              hintStyle: TextStyle(color: Colors.grey[500]))),
                    ],
                  )),
                  SizedBox(
                    width: screenSize.width * 0.02,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Last Name',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: themeColor),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                      TextFormField(
                          controller: lastNameController,
                          onChanged: (value) {
                            setState(() {
                              lastName = lastNameController.text;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Last name required";
                            } else {
                              return null;
                            }
                          },
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Enter last name',
                              hintStyle: TextStyle(color: Colors.grey[500]))),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: phoneNumberController,
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = phoneNumberController.text;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 10) {
                      return "Enter a valid phone number";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter phone number for contact',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      email = emailController.text;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter email for contact',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Date Of Birth',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    dob = dateController.text;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'DOB can\'t be null';
                  } else {
                    return null;
                  }
                },
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    print(date);
                    String formattedDate =
                        DateFormat('yyyy MM dd').format(date);
                    print(formattedDate);
                    setState(() {
                      dateController.text = formattedDate;
                    });
                  }
                },
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  icon: Icon(Icons.calendar_today_outlined),
                  label: Text('Pick your date of birth'),
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Degrees',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: degreeController,
                  onChanged: (value) {
                    setState(() {
                      degrees = degreeController.text;
                    });
                  },
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Degrees required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your degrees',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Register number',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: registerNumberController,
                  onChanged: (value) {
                    setState(() {
                      registerNumber = registerNumberController.text;
                    });
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Register number required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your register number',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Year Of Registartion',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: yearOfRegistrationController,
                  onChanged: (value) {
                    setState(() {
                      yearOfRegsitartion = yearOfRegistrationController.text;
                    });
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 4) {
                      return "Valid year of registration required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your year of registering as doctor',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'State Medical Council',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: stateMedicalCouncilController,
                  onChanged: (value) {
                    setState(() {
                      stateMedicalCouncil = stateMedicalCouncilController.text;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "State medical council required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'State Medical Council you are registered to',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Experience',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: experienceController,
                  onChanged: (value) {
                    setState(() {
                      experience = experienceController.text;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Experince required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter experince in years',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Address',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: addressController,
                  onChanged: (value) {
                    setState(() {
                      address = addressController.text;
                    });
                  },
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Address required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter full  address',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Zip code',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: zipCodeController,
                  onChanged: (value) {
                    setState(() {
                      zipCode = zipCodeController.text;
                    });
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Zip code required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your pincode',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'City',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: cityController,
                  onChanged: (value) {
                    setState(() {
                      city = cityController.text;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "City required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your city',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'State',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: stateController,
                  onChanged: (value) {
                    setState(() {
                      state = stateController.text;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "State required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your state',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Country',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                  controller: countryController,
                  onChanged: (value) {
                    setState(() {
                      country = countryController.text;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Country required";
                    } else {
                      return null;
                    }
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Enter your country',
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                'Certificate Upload',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              DottedBorder(
                  dashPattern: [6, 6, 6, 6],
                  child: InkWell(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                      if (result != null && result.files.isNotEmpty) {
                        File certificate = File(result.files.single.path!);
                        final bytesCertificate =
                            File(certificate.path).readAsBytesSync();
                        base64Certificate = base64Encode(bytesCertificate);
                        print("certificate: $certificate");
                        print(base64Certificate);

                        setState(() {
                          fileName = result.files.single.name;
                          fileChoosed = true;
                          openedPickerNullFile = false;
                        });
                      } else {
                        print("No files choosen");
                        setState(() {
                          fileName = null;
                          fileChoosed = false;
                          openedPickerNullFile = true;
                        });
                      }
                    },
                    child: Container(
                      height: 70.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.upload_file,
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Choose file to upload',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(
                child: Text(
                  fileChoosed
                      ? fileName!
                      : (openedPickerNullFile ? 'No file choosen' : ''),
                  style:
                      TextStyle(color: fileChoosed ? Colors.green : Colors.red),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              ElevatedButton(
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                    print('first name: $firstName');
                    print('last name: $lastName');
                    print('phone number: $phoneNumber');
                    print('email: $email');
                    print('dob: ${dob.toString()}');
                    print('degrees: $degrees');
                    print('reg no: $registerNumber');
                    print('year of reg: $yearOfRegsitartion');
                    print('state medical council: $stateMedicalCouncil');
                    print('experience $experience');
                    print('address $address');
                    print('zip code: $zipCode');
                    print('city: $city');
                    print('state: $state');
                    print('country: $country');
                    try {
                      Map<String, dynamic> _result =
                          await userRegistration.passUserDetails(
                              // base64Certificate,
                              // base64Image,
                              firstName,
                              lastName,
                              phoneNumber,
                              email,
                              dob,
                              degrees,
                              registerNumber,
                              yearOfRegsitartion,
                              stateMedicalCouncil,
                              experience,
                              address,
                              zipCode,
                              city,
                              state,
                              country);
                      print(_result);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false);
                    } catch (error) {
                      print(error);
                    }
                  },
                // },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: themeColor,
                    minimumSize: const Size.fromHeight(50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
