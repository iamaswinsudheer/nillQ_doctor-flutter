import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/appointmentHistory.dart';
import 'package:nillq_doctor_app/screens/home/futureAppointments.dart';
import 'package:nillq_doctor_app/screens/home/home.dart';
import 'package:nillq_doctor_app/shared/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  static const List<Widget> _screens = <Widget>[
    Home(),
    FutureAppointments(),
    AppointmentHistory()
  ];

  @override
  Widget build(BuildContext context) {
    if(FirebaseAuth.instance.currentUser != null){
      print(FirebaseAuth.instance.currentUser?.uid);
    }
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range), label: 'Future appointments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Appointment history'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: themeColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        // selectedFontSize: 11.0,
        // unselectedFontSize: 11.0,
        elevation: 0.0,
      ),
    );
  }
}
