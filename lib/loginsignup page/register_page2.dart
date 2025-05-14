import 'package:flutter/material.dart';
import 'package:healing_haven/doctorUI/privacypolicy.dart';
import 'package:healing_haven/loginsignup%20page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  bool isConfirmPasswordHidden = true;
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmpasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFF422b19),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Icon(
                  Icons.cloud_outlined,
                  size: 100,
                  color: Colors.grey.shade100,
                ),
                SizedBox(height: 20),
                Text(
                  "Create Your Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 30),
                MyTextField(
                  hintText: "Password",
                  ObsecureText: isPasswordHidden,
                  controller: passwordController,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                MyTextField(
                  hintText: "Confirm Password",
                  ObsecureText: isConfirmPasswordHidden,
                  controller: confirmpasswordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordHidden = !isConfirmPasswordHidden;
                      });
                    },
                  ),
                ),
                SizedBox(height: 80),
                Mybutton(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/homepageUser');
                  },
                  buttonTxt: "Create Account",
                  color: Colors.brown.shade100,
                  splashcolor: Colors.brown.shade100,
                  txtColor: Colors.brown.shade900,
                ),
                SizedBox(height: 40),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By creating an account or signing ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "you agree to our ",
                          style: TextStyle(color: Colors.grey[400]),
                        ),

                        GestureDetector(
                          onTap: () {
                            launchTermsAndConditions();
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 0.2),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue.shade600,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: Text(
                              "Terms and Conditions",
                              style: TextStyle(
                                color: Colors.blue[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
