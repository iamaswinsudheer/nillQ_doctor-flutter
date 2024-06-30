import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class ConsultationPlace extends StatefulWidget {
  const ConsultationPlace({super.key});

  @override
  State<ConsultationPlace> createState() => _ConsultationPlaceState();
}

class _ConsultationPlaceState extends State<ConsultationPlace> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.03,
              vertical: screenSize.height * 0.01),
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: ListView(
                  children: [
                    Text(
                      'Where are you consulting?',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.04,
                    ),
                    Text(
                      'Full address',
                      style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Place of consultation',
                          hintStyle: const TextStyle(color: Colors.grey)),
                      maxLines: 4,
                      cursorColor: Colors.grey,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                  child: ButtonTheme(
                    height: 10.0,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                            backgroundColor: themeColor,
                            minimumSize: const Size.fromHeight(40.0)),
                        child: const Text(
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        )),
                  ))
            ],
          )),
    );
  }
}
