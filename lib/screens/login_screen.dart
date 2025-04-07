import 'package:flutter/material.dart';
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
                onPressed: () {},
                child: Text('Login'),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text('forget password'),
                onPressed: () {},
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

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
