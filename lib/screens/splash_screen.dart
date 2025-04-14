import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_session/consts.dart';
import 'package:login_session/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const OnBoardingScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image as background
          Image.asset(
            'assets/images/image2.jpg',
            fit: BoxFit.cover,
            width:
                double
                    .infinity, // Ensures the image spans the full width of the screen
            height:
                double
                    .infinity, // Ensures the image spans the full height of the screen
          ),
          // Overlapping content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(color: kPrimaryColor, size: 150, CupertinoIcons.cart_fill),
                Text(
                  'AST Shop',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
