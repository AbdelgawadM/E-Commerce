import 'package:flutter/material.dart';
import 'package:login_session/components/custom_text_form.dart';
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
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFEB5425)),
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Login'),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text('forget password'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetScreen()),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('dont have account '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistScren()),
                    );
                  },
                  child: Text("sign up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
