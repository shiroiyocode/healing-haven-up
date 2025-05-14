import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const BottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GNav(
          backgroundColor: Colors.grey.shade300,
          color: Colors.grey.shade400,
          activeColor: Colors.brown.shade100,
          tabActiveBorder: Border.all(
            color: Colors.grey.shade300,
          ), //Colors.brown.shade300),
          tabBackgroundColor: Color(0xFF422b19),
          tabBorderRadius: 16,

          mainAxisAlignment: MainAxisAlignment.center,
          gap: 10,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: Colors.grey[600],
              text: " Home",
              iconActiveColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade100,
                fontWeight: FontWeight.w600,
              ),
            ),
            GButton(
              icon: Icons.contact_support,
              iconColor: Colors.grey[600],
              text: " Services",
              iconActiveColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade100,
                fontWeight: FontWeight.w600,
              ),
            ),
            GButton(
              icon: Icons.person,
              iconColor: Colors.grey[600],
              text: " Profile",
              iconActiveColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
