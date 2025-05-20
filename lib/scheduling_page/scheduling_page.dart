import 'package:flutter/material.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';
import 'package:intl/intl.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({super.key});

  @override
  State<SchedulingPage> createState() => _SchedulingPageState();
}

// Global Maps to track available and booked times per date
Map<DateTime, List<String>> availableTimesPerDate = {};
Map<DateTime, Set<String>> bookedTimesPerDate = {};

final List<String> defaultTimes = [
  '8:00 AM',
  '8:30 AM',
  '9:00 AM',
  '9:30 AM',
  '10:00 AM',
  '10:30 AM',
  '11:00 AM',
  '11:30 AM',
  '12:00 PM',
  '12:30 PM',
  '1:00 PM',
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

class _SchedulingPageState extends State<SchedulingPage> {
  DateTime selectedMonth = DateTime.now();
  DateTime? selectedDate;
  String _selectedTime = '';

  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _descriptionController = TextEditingController();

  List<String> months = List.generate(
    12,
    (i) => DateFormat.MMMM().format(DateTime(0, i + 1)),
  );

  // Helpers to determine allowed times for weekend vs weekday
  bool isInWeekendRange(String time) {
    final allowed = [
      '8:00 AM',
      '8:30 AM',
      '9:00 AM',
      '9:30 AM',
      '10:00 AM',
      '10:30 AM',
      '11:00 AM',
      '11:30 AM',
      '12:00 PM',
      '12:30 PM',
      '1:00 PM',
      '1:30 PM',
      '2:00 PM',
    ];
    return allowed.contains(time);
  }

  bool isInWeekdayRange(String time) {
    final allowed = [
      '10:00 AM',
      '10:30 AM',
      '11:00 AM',
      '11:30 AM',
      '12:00 PM',
      '12:30 PM',
      '1:00 PM',
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
    return allowed.contains(time);
  }

  // Generate list of days in the selected month
  List<DateTime> getDaysInMonth(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    return List.generate(
      lastDay.day,
      (i) => DateTime(month.year, month.month, i + 1),
    );
  }

  // Get available times for the selected date with caching
  List<String> getAvailableTimesForDate(DateTime date) {
    final dayOnly = DateTime(date.year, date.month, date.day);

    if (!availableTimesPerDate.containsKey(dayOnly)) {
      bool isWeekend =
          date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;

      availableTimesPerDate[dayOnly] =
          isWeekend
              ? defaultTimes.where((time) => isInWeekendRange(time)).toList()
              : defaultTimes.where((time) => isInWeekdayRange(time)).toList();
    }

    return availableTimesPerDate[dayOnly]!;
  }

  // Handle time selection update
  void _handleTimeSelected(String selectedTime) {
    setState(() {
      _selectedTime = selectedTime;
    });
  }

  // Mark a time as booked for the selected date
  void markTimeAsBooked(String time) {
    if (selectedDate != null) {
      final dayOnly = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
      );

      bookedTimesPerDate.putIfAbsent(dayOnly, () => <String>{});
      bookedTimesPerDate[dayOnly]!.add(time);
    }
    setState(() {
      _selectedTime = '';
    });
  }

  // Confirmation dialog before proceeding with booking
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
                  if (_selectedTime.isNotEmpty) {
                    markTimeAsBooked(_selectedTime);
                  }
                  Navigator.pop(context); // Close the dialog
                  Navigator.pop(context); // Close scheduling page
                  Navigator.pushNamed(context, '/waitingpage'); // Navigate
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
  void dispose() {
    _fullNameController.dispose();
    _ageController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = getDaysInMonth(selectedMonth);
    final timesForSelectedDay =
        selectedDate != null ? getAvailableTimesForDate(selectedDate!) : [];

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Book an Appointment"),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.brown.shade800),
        titleTextStyle: TextStyle(
          color: Colors.brown.shade800,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Month and Days selector container
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400.withOpacity(0.3),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 160,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Month dropdown picker
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16,
                          bottom: 16,
                          top: 12,
                        ),
                        child: DropdownButton<String>(
                          value:
                              selectedMonth != null
                                  ? DateFormat.MMMM().format(selectedMonth)
                                  : null,
                          onChanged: (String? newValue) {
                            if (newValue == null) return;
                            int monthIndex = months.indexOf(newValue) + 1;
                            setState(() {
                              selectedMonth = DateTime(
                                selectedMonth.year,
                                monthIndex,
                                1,
                              );
                              // Reset selectedDate to first day of new month
                              selectedDate = DateTime(
                                selectedMonth.year,
                                monthIndex,
                                1,
                              );
                              // Reset selectedTime since date changed
                              _selectedTime = '';
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
                          underline: SizedBox(),
                          dropdownColor: Colors.grey.shade100,
                        ),
                      ),

                      // Days horizontal scroll with arrows
                      Container(
                        height: 80,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left arrow
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.brown.shade800,
                                ),
                                onPressed: () {
                                  setState(() {
                                    // move selectedMonth one month back
                                    selectedMonth = DateTime(
                                      selectedMonth.year,
                                      selectedMonth.month - 1,
                                      1,
                                    );
                                    selectedDate = DateTime(
                                      selectedMonth.year,
                                      selectedMonth.month,
                                      1,
                                    );
                                    _selectedTime = '';
                                  });
                                },
                              ),
                            ),

                            // Scrollable days list
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: days.length,
                                itemBuilder: (context, index) {
                                  final day = days[index];
                                  bool isSelected =
                                      selectedDate != null &&
                                      day.day == selectedDate!.day &&
                                      day.month == selectedDate!.month;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedDate = day;
                                        _selectedTime = '';
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? Colors.brown.shade800
                                                : Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow:
                                            isSelected
                                                ? [
                                                  BoxShadow(
                                                    color: Colors.brown.shade300
                                                        .withOpacity(0.6),
                                                    blurRadius: 4,
                                                    offset: Offset(0, 3),
                                                  ),
                                                ]
                                                : null,
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
                                          fontSize: 14,
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
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.brown.shade800,
                                ),
                                onPressed: () {
                                  setState(() {
                                    // move selectedMonth one month forward
                                    selectedMonth = DateTime(
                                      selectedMonth.year,
                                      selectedMonth.month + 1,
                                      1,
                                    );
                                    selectedDate = DateTime(
                                      selectedMonth.year,
                                      selectedMonth.month,
                                      1,
                                    );
                                    _selectedTime = '';
                                  });
                                },
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
              Text(
                "Available Times",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
              ),
              SizedBox(height: 10),

              // Available times wrapped buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child:
                    selectedDate == null
                        ? Text(
                          "Please select a day",
                          style: TextStyle(color: Colors.red),
                        )
                        : Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              timesForSelectedDay.map((time) {
                                final dayOnly = DateTime(
                                  selectedDate!.year,
                                  selectedDate!.month,
                                  selectedDate!.day,
                                );

                                final isBooked =
                                    bookedTimesPerDate[dayOnly]?.contains(
                                      time,
                                    ) ??
                                    false;
                                final isSelected = _selectedTime == time;

                                return GestureDetector(
                                  onTap:
                                      isBooked
                                          ? null
                                          : () => _handleTimeSelected(time),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3 -
                                        16,
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      color:
                                          isBooked
                                              ? Colors.grey.shade500
                                              : (isSelected
                                                  ? Colors.brown.shade800
                                                  : Colors.grey.shade100),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow:
                                          isSelected
                                              ? [
                                                BoxShadow(
                                                  color: Colors.brown.shade800
                                                      .withOpacity(0.5),
                                                  blurRadius: 6,
                                                  offset: Offset(0, 3),
                                                ),
                                              ]
                                              : null,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      time,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            isBooked
                                                ? Colors.white70
                                                : (isSelected
                                                    ? Colors.white
                                                    : Colors.black),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
              ),

              // Form for user details
              Form(
                key: _formKey,
                child: Padding(
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

                      // Full Name field with validation
                      TextFormField(
                        controller: _fullNameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Full Name is required.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'John Doe',
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

                      // Age field with validation
                      TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Age is required.';
                          }
                          final age = int.tryParse(value);
                          if (age == null || age <= 0 || age > 120) {
                            return 'Please enter a valid age.';
                          }
                          return null;
                        },
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

                      // Description field with validation
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 6,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please describe your problem.';
                          }
                          return null;
                        },
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
              ),

              // Proceed button with validation and confirmation
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Mybutton(
                  onTap: () {
                    if (selectedDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select a day first')),
                      );
                      return;
                    }
                    if (_selectedTime.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select a time first')),
                      );
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      areyouSure(context);
                    }
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
