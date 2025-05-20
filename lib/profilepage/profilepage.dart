import 'package:flutter/material.dart';
import 'package:healing_haven/profilepage/settingsUser.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile Settings"),
        backgroundColor: Colors.grey.shade300,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header
              Container(
                padding: EdgeInsets.only(
                  top: 25,
                  right: 25,
                  bottom: 15,
                  left: 20,
                ),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    // Circular Profile Picture
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kenneth the Certified User',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'NOSLEEP',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(thickness: 1, color: Colors.white),
              ),

              // Settings section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Settings(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
