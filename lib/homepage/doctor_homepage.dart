import 'package:flutter/material.dart';
import 'package:healing_haven/homepage/utils/cancel_appointmet.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  Widget build(BuildContext context) {
    //Dialog for accepting or cancel
    void Accept(BuildContext context) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              backgroundColor: Colors.grey.shade200,
              title: Text("Approved"),
              icon: Icon(
                Icons.check_circle_rounded,
                color: Colors.green,
                size: 100,
              ),
              actions: [
                // Cancel button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                // Proceed button
              ],
            ),
      );
    }

    void Cancel(BuildContext context) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              backgroundColor: Colors.grey.shade200,
              title: const Text("Cancelled"),
              icon: Icon(
                Icons.cancel,
                color: Colors.redAccent.shade700,
                size: 100,
              ),
              actions: [
                // Cancel button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Back', style: TextStyle(color: Colors.grey)),
                ),
                // Reason input button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the first dialog

                    // Open the reason input dialog
                    showDialog(
                      context: context,
                      builder:
                          (context) => CancelReasonDialog(
                            onSend: (reason) {
                              // TODO: Handle reason (e.g., send to backend or show confirmation)
                              print("Reason for cancellation: $reason");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.brown[700],
                                  content: Text("Patient has been notified."),
                                ),
                              );
                            },
                          ),
                    );
                  },
                  child: Text(
                    'Notify Patient',
                    style: TextStyle(color: Colors.brown.shade800),
                  ),
                ),
              ],
            ),
      );
    }

    // Dummy list of pending consultations
    final List<Map<String, String>> pendingConsultations = [
      {
        'name': 'Kenneth Reyes',
        'time': 'April 20, 2025 - 10:00 AM',
        'reason': 'No Sleep',
      },
      {
        'name': 'Asa',
        'time': 'April 20, 2025 - 10:00 AM',
        'reason': 'Just feel like it',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        automaticallyImplyLeading: false,
        title: Text(
          "Healing Haven",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.brown.shade900,
          ),
        ),
      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white, // A darker, more chocolatey brown
                Colors.grey.shade200, // A deeper, earthier brown
                Colors.grey.shade300,

                // Dark brown
                // Dark brown
                // Lighter warm brown
                // Even lighter brown/cream
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(color: Colors.brown[800]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back, Dr. Wong 👋",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Here are your pending consultations today.",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Pending Consultations List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: pendingConsultations.length,
                  itemBuilder: (context, index) {
                    final consult = pendingConsultations[index];
                    return Card(
                      margin: EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              consult['name'] ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text("Time: ${consult['time']}"),
                            Text("Reason: ${consult['reason']}"),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  onPressed: () {
                                    // Handle approve
                                    Accept(context);
                                  },
                                  child: Text(
                                    "Approve",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red[600],
                                  ),
                                  onPressed: () {
                                    Cancel(context);
                                    // Handle cancel
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
