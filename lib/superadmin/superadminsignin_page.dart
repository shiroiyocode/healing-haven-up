import 'package:flutter/material.dart';
import 'package:healing_haven/loginsignup%20page/forgot_pass.dart';
import 'package:healing_haven/loginsignup%20page/utils/my_text_field.dart';
import 'package:healing_haven/loginsignup%20page/utils/mybutton.dart';
import 'package:healing_haven/loginsignup%20page/utils/square_tile.dart';

class LoginPageSuperAdmin extends StatelessWidget {
  const LoginPageSuperAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final superAdminUsernameController = TextEditingController();
    final superAdminPasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.brown[900],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  "???????👑",
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
                  controller: superAdminUsernameController,
                ),
                SizedBox(height: 10),
                MyTextField(
                  hintText: "Password",
                  ObsecureText: true,
                  controller: superAdminPasswordController,
                ),
                SizedBox(height: 30),
                Mybutton(
                  txtColor: Colors.brown.shade900,
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/superadminpage',
                      (Route<dynamic> route) => false,
                    );
                  },
                  buttonTxt: "Sign In",
                  color: Colors.brown.shade100,
                  splashcolor: Colors.brown.shade100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
