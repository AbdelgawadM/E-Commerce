import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_session/features/auth_feature/components/custom_button.dart';
import 'package:login_session/features/auth_feature/components/custom_text_form.dart';
import 'package:login_session/features/auth_feature/components/statement_row.dart';
import 'package:login_session/features/main_feature/screens/home_screen.dart';

class RegistScren extends StatelessWidget {
  const RegistScren({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Image(image: AssetImage('assets/images/freed.png')),
            const SizedBox(height: 30),
            CustomTextForm(label: 'Name', controller: nameController),
            const SizedBox(height: 20),
            CustomTextForm(label: 'Email', controller: emailController),
            const SizedBox(height: 20),
            CustomTextForm(label: 'Password', controller: passwordController),
            const SizedBox(height: 20),
            CustomTextForm(
              label: 'Confirm Password',
              controller: confirmPasswordController,
            ),
            const SizedBox(height: 30),
            CustomButton(
              buttonText: 'Sign Up',
              screen: () async {
                if (passwordController.text != confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Passwords do not match')),
                  );
                  return;
                }
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Signup failed: ${e.toString()}')),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
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
