import 'package:flutter/material.dart';
import 'package:healing_haven/loginsignup%20page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final dateController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> selectedDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  void _handleNext() {
    if (_formKey.currentState!.validate()) {
      // Full phone number already stored in numberController
      String fullPhoneNumber = numberController.text.trim();
      print("Full Phone Number: $fullPhoneNumber");

      Navigator.pushNamed(context, '/registerpage2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF422b19),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    alignment: const Alignment(-0.75, 0),
                    child: const Text(
                      "Personal Information",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  MyTextField(
                    hintText: "Last Name",
                    ObsecureText: false,
                    controller: lastnameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  MyTextField(
                    hintText: "First Name",
                    ObsecureText: false,
                    controller: firstnameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        fillColor: Colors.brown.shade100,
                        hintText: 'Birth Date (yyyy-mm-dd)',
                        filled: true,
                        prefixIcon: const Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      readOnly: true,
                      onTap: selectedDate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your birth date';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    alignment: const Alignment(-0.75, 0),
                    child: const Text(
                      "Contact Information",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        fillColor: Colors.brown.shade100,
                        filled: true,
                        hintText: 'Phone Number',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      initialCountryCode: 'PH',
                      onChanged: (phone) {
                        numberController.text = phone.completeNumber;
                      },
                      validator: (phone) {
                        if (phone == null || phone.number.trim().isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  MyTextField(
                    hintText: "Email address",
                    ObsecureText: false,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!_isValidEmail(value.trim())) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  Mybutton(
                    color: Colors.brown.shade100,
                    txtColor: Colors.brown.shade900,
                    splashcolor: Colors.brown.shade100,
                    onTap: _handleNext,
                    buttonTxt: "Next",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
