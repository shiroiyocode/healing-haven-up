import 'package:flutter/material.dart';
import 'package:healing_haven/doctorUI/bottomnav_barDoctor.dart';
import 'package:healing_haven/doctorUI/doctor_scheduleacc.dart';
import 'package:healing_haven/doctorUI/profiledoctor.dart';
import 'package:healing_haven/homepage/doctor_homepage.dart';

class DoctorHomePage1 extends StatefulWidget {
  const DoctorHomePage1({super.key});

  @override
  State<DoctorHomePage1> createState() => _DoctorHomePage1State();
}

class _DoctorHomePage1State extends State<DoctorHomePage1> {
  int selectedIndex = 0;
  //Bottombar
  final List<Widget> pages = [
    const DoctorHomePage(),
    const DoctorSchedulePage(),
    const DoctorProfilePage(),
  ];

  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbarDoc(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: pages[selectedIndex],
    );
  }
}
