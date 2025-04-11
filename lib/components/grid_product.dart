import 'package:flutter/cupertino.dart';

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
