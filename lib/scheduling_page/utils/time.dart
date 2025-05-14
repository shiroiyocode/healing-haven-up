import 'package:flutter/material.dart';

class TimeUtil extends StatelessWidget {
  final List<String> availableTimes;
  final Function(String) onTimeSelected;

  TimeUtil({required this.availableTimes, required this.onTimeSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Available Time Slots:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: availableTimes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(availableTimes[index]),
              onTap: () {
                onTimeSelected(availableTimes[index]);
              },
            );
          },
        ),
      ],
    );
  }
}
