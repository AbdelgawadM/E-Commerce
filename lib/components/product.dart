import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image1.jpg'),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150,
              width: 100,
            ),
            Text(
              'T-Shirt',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$300',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFE87376),
              ),
            ),
          ],
        ),
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            child: Icon(color: Colors.red, CupertinoIcons.heart_fill),
          ),
        ),
      ],
    );
  }
}
