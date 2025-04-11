import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:login_session/screens/checkout_screen.dart';
import 'package:login_session/screens/home_screen.dart';
import 'package:login_session/screens/product_overview.dart';

Future<void> main() async {
  runApp(
    DevicePreview(
      enabled: true, // Set to false to disable it in production
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: CheckoutScreen(),
    );
  }
}
