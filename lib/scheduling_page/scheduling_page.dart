import "package:flutter/material.dart";
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';
import 'package:intl/intl.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({super.key});

  @override
  State<SchedulingPage> createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  DateTime selectedMonth = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String _selectedTime = '';

  List<String> months = List.generate(
    12,
    (i) => DateFormat.MMMM().format(DateTime(0, i + 1)),
  );

  List<DateTime> getDaysInMonth(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    return List.generate(
      lastDay.day,
      (i) => DateTime(month.year, month.month, i + 1),
    );
  }

  void _handleTimeSelected(String selectedTime) {
    setState(() {
      _selectedTime = selectedTime;
    });
  }

  List<String> availableTimes = [
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
    '4:30 PM',
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
    '6:30 PM',
    '7:00 PM',
  ];

  void areyouSure(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.grey.shade200,
            title: Text(
              'Confirmation',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Text(
              'Are you sure about the details you want to proceed with the consultation?',
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              // Cancel button
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('Cancel', style: TextStyle(color: Colors.grey)),
              ),
              // Proceed button
              TextButton(
                onPressed: () {
                  // Handle confirmation action here
                  Navigator.pop(context); // Close the dialog
                  // You can perform further actions for confirmation
                  Navigator.pushNamed(context, '/waitingpage');
                },
                child: Text(
                  'Proceed',
                  style: TextStyle(color: Colors.brown.shade800),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = getDaysInMonth(selectedMonth);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Book an Appointment"),
        backgroundColor: Colors.grey.shade200,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  height: 160,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Month Picker
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16,
                          bottom: 16,
                        ),
                        child: DropdownButton<String>(
                          value: DateFormat.MMMM().format(selectedMonth),
                          onChanged: (String? newValue) {
                            int monthIndex = months.indexOf(newValue!) + 1;
                            setState(() {
                              selectedMonth = DateTime(
                                selectedMonth.year,
                                monthIndex,
                                1,
                              );
                              selectedDate = DateTime(
                                selectedMonth.year,
                                monthIndex,
                                1,
                              );
                            });
                          },
                          items:
                              months.map((String month) {
                                return DropdownMenuItem<String>(
                                  value: month,
                                  child: Text(
                                    month,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown.shade800,
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),

                      // Days Scroll
                      Container(
                        height: 80,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left arrow
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Center(child: Icon(Icons.arrow_back_ios)),
                            ),

                            // Scrollable days
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: days.length,
                                itemBuilder: (context, index) {
                                  final day = days[index];
                                  bool isSelected =
                                      day.day == selectedDate.day &&
                                      day.month == selectedDate.month;

                                  return GestureDetector(
                                    onTap:
                                        () =>
                                            setState(() => selectedDate = day),
                                    child: Container(
                                      width: 60,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? Colors.brown.shade800
                                                : Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${day.day}\n${DateFormat.E().format(day).toUpperCase()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            // Right arrow
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Center(
                                child: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Available Times"),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Wrap(
                  spacing: 8, // less space between horizontal items
                  runSpacing: 8, // less space between rows
                  children:
                      availableTimes.map((time) {
                        bool isSelected = _selectedTime == time;
                        return GestureDetector(
                          onTap: () => _handleTimeSelected(time),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width / 3 -
                                16, // ~5 per row
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                            ), // less vertical padding
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? Colors.brown.shade800
                                      : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              time,
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade800,
                      ),
                    ),
                    SizedBox(height: 10),

                    // Full Name (auto-filled)
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText:
                            'John Doe', // Replace with actual user name from account
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.brown.shade800,
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                    SizedBox(height: 12),

                    // Age
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.brown.shade800,
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                    SizedBox(height: 12),

                    // Reason for Appointment
                    TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Describe your problem',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.brown.shade800,
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Mybutton(
                  onTap: () {
                    areyouSure(context);
                  },
                  buttonTxt: "Proceed",
                  color: Colors.brown.shade800,
                  splashcolor: Colors.brown.shade800,
                  txtColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
