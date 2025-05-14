import 'package:flutter/material.dart';
import 'package:healing_haven/loginsignup%20page/forgot_pass.dart';
import 'package:healing_haven/loginsignup%20page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';
import 'package:healing_haven/loginsignup%20page/utils/square_tile.dart';

class LoginPageDoctor extends StatelessWidget {
  const LoginPageDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final adminUsernameController = TextEditingController();
    final adminPasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFF422b19),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 120,
                    width: 240,
                    child: Image.asset('lib/images/31.png', fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Sign in as a Doctor",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                MyTextField(
                  hintText: "Email",
                  ObsecureText: false,
                  controller: adminUsernameController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: "Password",
                  ObsecureText: true,
                  controller: adminPasswordController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ForgotPasswordPage(
                                onBackToLogin: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/logindoctor',
                                  ); // Or use pushReplacementNamed for safety
                                },
                              ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment(0.8, 0),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Mybutton(
                  txtColor: Colors.brown.shade900,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/doctorhomepage');
                  },
                  buttonTxt: "Sign In",
                  color: Colors.brown.shade100,
                  splashcolor: Colors.brown.shade100,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.brown.shade300,
                      ),
                    ),
                    Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.brown.shade300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(Imagepath: 'lib/images/g.png'),
                    SizedBox(width: 20),
                    SquareTile(Imagepath: 'lib/images/f.png'),
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
