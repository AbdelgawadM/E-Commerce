import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
        ),
        child: Center(child: Text(data)),
      ),
    );
  }
}
