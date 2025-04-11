import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:login_session/screens/another_screen.dart';
import 'package:login_session/screens/home_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;

  final List<Widget> _screens = [
    HomeTabScreen(),
    AnotherScreen(text: 'cart'),
    AnotherScreen(text: 'favourites'),
    AnotherScreen(text: 'profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _screens[_bottomNavIndex], // بدل ما نستخدم SingleChildScrollView هنا
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.qrcode),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home,
          CupertinoIcons.cart,
          CupertinoIcons.heart_fill,
          CupertinoIcons.profile_circled,
        ],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          setState(() => _bottomNavIndex = index);
        },
      ),
    );
  }
}
