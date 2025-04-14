import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_session/consts.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.text,
    required this.image,
    required this.price,
    required this.ontap,
  });
  final String text, image;
  final double price;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 167,
            width: 167,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 160,
                  child: Text(
                    softWrap: true,
                    text,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
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
