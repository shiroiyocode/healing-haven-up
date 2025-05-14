import 'package:flutter/material.dart';
import 'package:healing_haven/loginsignup%20page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';

class ForgotPasswordPage extends StatelessWidget {
  final VoidCallback? onBackToLogin;
  const ForgotPasswordPage({super.key, this.onBackToLogin});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFF422b19),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_reset, size: 100, color: Colors.grey.shade100),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/hiddenpage');
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Enter your email address and we'll send you instructions to reset your password.",
                    style: TextStyle(color: Colors.grey[400]),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                MyTextField(
                  hintText: "Email",
                  ObsecureText: false,
                  controller: emailController,
                ),
                SizedBox(height: 40),
                Mybutton(
                  onTap: () {
                    // Trigger password reset logic here
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text("Reset Link Sent"),
                            content: Text(
                              "Check your email for a link to reset your password.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                    );
                  },
                  buttonTxt: "Send Reset Link",
                  color: Colors.brown.shade100,
                  splashcolor: Colors.brown.shade100,
                  txtColor: Colors.brown.shade900,
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: onBackToLogin,
                  child: Text(
                    "Back to Login",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
