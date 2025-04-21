import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_session/features/auth_feature/components/custom_button.dart';
import 'package:login_session/features/auth_feature/components/custom_text_form.dart';
import 'package:login_session/features/auth_feature/components/statement_row.dart';
import 'package:login_session/features/auth_feature/screens/forget_screen.dart';
import 'package:login_session/features/main_feature/screens/home_screen.dart';
import 'package:login_session/features/auth_feature/screens/regist_scren.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 200),
            const Image(image: AssetImage('assets/images/freed.png')),
            const SizedBox(height: 30),
            CustomTextForm(label: 'Email', controller: emailController),
            const SizedBox(height: 20),
            CustomTextForm(label: 'Password', controller: passwordController),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Login',
              screen: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login failed: ${e.toString()}')),
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: const Text(
                  'forget password',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetScreen(),
                    ),
                  );
                },
              ),
            ),
            StatementRow(
              statement: 'don\'t have Account ?',
              buttonText: 'Sign Up Now',
              screen: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistScren()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
