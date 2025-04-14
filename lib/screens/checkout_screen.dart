import 'package:flutter/material.dart';
import 'package:login_session/consts.dart';
import 'package:login_session/screens/payment_screen.dart';
import 'package:login_session/screens/product_overview.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CheckoutRow(),
              SizedBox(height: 20),

              CheckoutRow(),
              SizedBox(height: 20),

              CheckoutRow(),
              SizedBox(height: 20),

              CheckoutRow(),
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select All',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Checkbox(value: false, onChanged: (data) {}),
                ],
              ),

              SizedBox(height: 40, child: Divider()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '\$300.00',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
                  ),

                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
                  },
                  child: Text('Pay Now'),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutRow extends StatelessWidget {
  const CheckoutRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Checkbox(value: true, onChanged: (data) {}),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image1.jpg'),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 100,
          width: 60,
        ),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'T-Shirt',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Hoaded Jacket',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
            ),

            SizedBox(height: 15),
            Text(
              '\$300',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
        SizedBox(width: 25),
        FirstRow(text: '-'),
        SizedBox(width: 20),
        FirstRow(text: '1'),
        SizedBox(width: 20),
        FirstRow(text: '+'),
      ],
    );
  }
}
