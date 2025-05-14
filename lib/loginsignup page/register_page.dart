import 'package:flutter/material.dart';
import 'package:healing_haven/loginsignup%20page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';

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

  @override
  Widget build(BuildContext context) {
    Future<void> selectedDate() async {
      DateTime? picked = await await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        setState(() {
          dateController.text = picked.toString().split(" ")[0];
        });
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF422b19),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment(-0.75, 0),
                  child: Text(
                    "Personal Information",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                MyTextField(
                  hintText: "Last Name",
                  ObsecureText: false,
                  controller: lastnameController,
                ),
                SizedBox(height: 30),
                MyTextField(
                  hintText: "First Name",
                  ObsecureText: false,
                  controller: firstnameController,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      fillColor: Colors.brown.shade100,
                      hintText: 'Birth Date (mm/dd/yyyy)',
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      selectedDate();
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment(-0.75, 0),
                  child: Text(
                    "Contact Information",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                MyTextField(
                  hintText: "Phone Number",
                  ObsecureText: false,
                  controller: numberController,
                ),
                SizedBox(height: 30),
                MyTextField(
                  hintText: "Email address",
                  ObsecureText: false,
                  controller: emailController,
                ),
                SizedBox(height: 30),
                Mybutton(
                  color: Colors.brown.shade100,
                  txtColor: Colors.brown.shade900,
                  splashcolor: Colors.brown.shade100,
                  onTap: () {
                    Navigator.pushNamed(context, '/registerpage2');
                  },
                  buttonTxt: "Next",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
