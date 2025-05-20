import 'package:flutter/material.dart';
import 'package:healing_haven/homepage/utils/cancel_appointmet.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  // List of pending consultations
  List<Map<String, String>> pendingConsultations = [
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

  @override
  Widget build(BuildContext context) {
    // Dialog for accepting a consultation
    void Accept(BuildContext context, int index) {
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
                // Done button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    setState(() {
                      // Remove the consultation from the list
                      pendingConsultations.removeAt(index);
                    });
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ],
            ),
      );
    }

    // Dialog for canceling a consultation
    void Cancel(BuildContext context, int index) {
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
                // Back button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Back', style: TextStyle(color: Colors.grey)),
                ),
                // Notify Patient button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the first dialog

                    // Open the reason input dialog
                    showDialog(
                      context: context,
                      builder:
                          (context) => CancelReasonDialog(
                            onSend: (reason) {
                              // Handle reason (e.g., send to backend or show confirmation)
                              print("Reason for cancellation: $reason");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.brown[700],
                                  content: Text("Patient has been notified."),
                                ),
                              );
                              setState(() {
                                // Remove the consultation from the list
                                pendingConsultations.removeAt(index);
                              });
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
                Colors.white,
                Colors.grey.shade200,
                Colors.grey.shade300,
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
                                    Accept(context, index);
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
                                    Cancel(context, index);
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
