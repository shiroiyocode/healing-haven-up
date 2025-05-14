import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({super.key});

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder Illustration
              Lottie.network(
                'https://lottie.host/8f0d632b-3df1-4051-9c39-e51d821e6634/BH2UE2jzVu.json',
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
              // Title
              Text(
                'Waiting for Approval',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Subtitle
              Text(
                'Please wait while we process your consultation request. You will be notified once your request has been approved.',
                style: TextStyle(fontSize: 16, color: Colors.brown.shade700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Optional Placeholder Button (if needed)
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.refresh),
                label: Text('Refresh Status'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade300,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/homepageUser');
                },
                icon: Icon(Icons.home),
                label: Text('Return to Homepage'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade300,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
