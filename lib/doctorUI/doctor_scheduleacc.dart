import 'package:flutter/material.dart';

class DoctorSchedulePage extends StatelessWidget {
  const DoctorSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Appointments"),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[300],
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade800,
          ),
          bottom: TabBar(
            labelColor: Colors.brown.shade900,
            indicatorColor: Colors.brown.shade700,
            tabs: const [
              Tab(text: "Past"),
              Tab(text: "Today"),
              Tab(text: "Upcoming"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildScheduleList(context, "Past"),
            _buildScheduleList(context, "Today"),
            _buildScheduleList(context, "Upcoming"),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleList(BuildContext context, String type) {
    final List<Map<String, String>> sampleSchedules = [
      {
        'patient': 'Kenneth Reyes',
        'time': '9:00 AM',
        'date': 'April 18, 2025',
        'reason': 'Check-up',
      },
      {
        'patient': 'Asa',
        'time': '11:30 AM',
        'date': 'April 19, 2025',
        'reason': 'Follow-up',
      },
    ];

    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: sampleSchedules.length,
        itemBuilder: (context, index) {
          final sched = sampleSchedules[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                sched['patient'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text("Date: ${sched['date']}"),
                  Text("Time: ${sched['time']}"),
                  Text("Reason: ${sched['reason']}"),
                ],
              ),
              trailing: Icon(
                Icons.calendar_today,
                color: Colors.brown.shade400,
              ),
            ),
          );
        },
      ),
    );
  }
}
