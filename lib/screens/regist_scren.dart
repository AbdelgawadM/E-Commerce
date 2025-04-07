import 'package:flutter/material.dart';
import 'package:login_session/screens/login_screen.dart';

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
            SizedBox(height: 20),

            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFEB5425)),
                ),
                onPressed: () {},
                child: Text('Sign Up'),
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
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text("Login "),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
