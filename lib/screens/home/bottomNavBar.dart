import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/home/consultation/schedules.dart';
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
    AppointmentSchedules(),
    FutureAppointments()
  ];

  @override
  Widget build(BuildContext context) {
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
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'Appointments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range), label: 'Future'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: themeColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0.0,
      ),
    );
  }
}
