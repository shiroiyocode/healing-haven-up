import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _LnameController = TextEditingController();
  final TextEditingController _FnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.brown.shade100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Name Field
              TextField(
                controller: _LnameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.brown.shade800,
                      width: 2,
                    ),
                  ),

                  hintText: 'Enter your Last name',
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),

              SizedBox(height: 16),

              TextField(
                controller: _FnameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.brown.shade800,
                      width: 2,
                    ),
                  ),

                  hintText: 'Enter your first name',
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),

              SizedBox(height: 16),

              // Email Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.brown.shade800,
                      width: 2,
                    ),
                  ),
                  hintText: 'Enter your email address',
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              SizedBox(height: 16),

              // Phone Number Field
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.brown.shade800,
                      width: 2,
                    ),
                  ),
                  hintText: 'Enter your phone number',
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              SizedBox(height: 16),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  // Handle save changes

                  String email = _emailController.text;
                  String phone = _phoneController.text;
                  String Fname = _FnameController.text;
                  String Lname = _LnameController.text;
                  // You can add the logic to update the profile here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.brown.shade800, // Set background color here
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ), // Optional: customize padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ), // Optional: round the corners
                  ),
                ),
                child: Text(
                  'Save Changes', // Button text
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ), // Text color (white for contrast)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
