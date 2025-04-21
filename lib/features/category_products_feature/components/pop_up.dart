import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_session/consts.dart';
import 'package:login_session/cubits/add_to_cart_cubit/cart_cubit.dart';
import 'package:login_session/models/product_model.dart';
import 'package:login_session/features/checkout_feature/screens/checkout_screen.dart';

class PopUp extends StatelessWidget {
  const PopUp({super.key, required this.price, required this.product});
  final double price;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black12,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutScreen()),
              );
            },
            color: kPrimaryColor,
            icon: Icon(CupertinoIcons.cart_fill),
          ),
        ),
        SizedBox(
          height: 50,
          width: 250,
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.white),
              backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
            ),
            onPressed: () {
              final wasAdded = context.read<CartCubit>().addToCart(product);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded
                        ? 'Product added to cart.'
                        : 'Product is already in cart.',
                  ),
                  duration: Duration(seconds: 1),
                  backgroundColor: wasAdded ? Colors.green : Colors.orange,
                ),
              );

              // Optional: still show bottom sheet even if already in cart
            },

            child: Text('Add to cart'),
          ),
        ),
      ],
    );
  }
}
