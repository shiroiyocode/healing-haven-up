import 'package:flutter/material.dart';
import 'package:healing_haven/doctorUI/settingsAdmin.dart';

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile Settings"),
        backgroundColor: Colors.grey[300],
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.brown.shade800,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Circular Profile Picture
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          'https://static.seriousmd.com/profile_pictures/doctor_profile_4712_a317745e-5dff-406d-b8e1-4a4840735e4f.jpg',
                        ),
                      ),
                      SizedBox(width: 20),
                      // Doctor Info
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Deo Adiel Wong',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade900,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Dermatologist',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 1, color: Colors.grey),
            ),

            // Settings section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SettingsAdmin(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
