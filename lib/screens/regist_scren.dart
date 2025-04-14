import 'package:flutter/material.dart';
import 'package:login_session/components/custom_button.dart';
import 'package:login_session/components/custom_text_form.dart';
import 'package:login_session/components/statement_row.dart';
import 'package:login_session/screens/home_screen.dart';

class RegistScren extends StatelessWidget {
  const RegistScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 100),
            Image(image: AssetImage('assets/images/freed.png')),
            SizedBox(height: 30),
            CustomTextForm(label: 'Name'),
            SizedBox(height: 20),
            CustomTextForm(label: 'Email'),
            SizedBox(height: 20),
            CustomTextForm(label: 'password'),
            SizedBox(height: 20),
            CustomTextForm(label: 'confirm password'),
            SizedBox(height: 30),
            CustomButton(
              buttonText: 'Sign Up',
              screen: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            StatementRow(
              statement: 'Already have Account ?',
              buttonText: 'Login Now',
              screen: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
