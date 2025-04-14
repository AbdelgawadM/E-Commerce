import 'package:flutter/material.dart';
import 'package:login_session/components/custom_button.dart';
import 'package:login_session/components/custom_text_form.dart';
import 'package:login_session/components/statement_row.dart';
import 'package:login_session/screens/forget_screen.dart';
import 'package:login_session/screens/home_screen.dart';
import 'package:login_session/screens/regist_scren.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 200),
            Image(image: AssetImage('assets/images/freed.png')),
            SizedBox(height: 30),
            CustomTextForm(label: 'Email'),
            SizedBox(height: 20),
            CustomTextForm(label: 'password'),
            SizedBox(height: 20),
            CustomButton(
              buttonText: 'Login',
              screen: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text(
                  'forget password',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetScreen()),
                  );
                },
              ),
            ),
            StatementRow(
              statement: 'dont have Account ?',
              buttonText: 'Sign Up Now',
              screen: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistScren()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
