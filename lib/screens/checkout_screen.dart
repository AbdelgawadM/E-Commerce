import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image(image: AssetImage('assets/images/image1.jpg')),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'T-Shirt',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Hoaded Jacket',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
