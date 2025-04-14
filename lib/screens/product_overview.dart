import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:login_session/consts.dart';
import 'package:login_session/screens/checkout_screen.dart';

class ProductOverview extends StatelessWidget {
  const ProductOverview({
    super.key,
    required this.sampleImages,
    required this.productName,
    required this.description,
    required this.price,
  });
  final List<String> sampleImages;
  final String productName, description;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text(
          'Product Overview',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  // Type 1
                  FanCarouselImageSlider.sliderType1(
                    imagesLink: sampleImages,
                    isAssets: false,
                    autoPlay: true,
                    sliderHeight: 300,
                    showIndicator: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              productName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$$price',
                        style: TextStyle(
                          color: Color(0xFFE87376),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder:
                        (context, _) => Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (double value) {},
                  ),
                  SizedBox(height: 20),
                  Text(softWrap: true, description),
                  SizedBox(height: 20),
                ],
              ),
            ),

            Row(
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
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(),
                        ),
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
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              height: 300,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        FirstRow(text: 'Size'),
                                        SizedBox(width: 37),
                                        FirstRow(text: 'S'),
                                        SizedBox(width: 20),
                                        FirstRow(text: 'M'),
                                        SizedBox(width: 20),
                                        FirstRow(text: 'L'),
                                        SizedBox(width: 20),
                                        FirstRow(text: 'XL'),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        FirstRow(text: 'Color'),
                                        SizedBox(width: 25),
                                        ColorWidget(color: Colors.red),
                                        SizedBox(width: 20),
                                        ColorWidget(color: Colors.blue),
                                        SizedBox(width: 20),
                                        ColorWidget(color: Colors.green),
                                        SizedBox(width: 20),
                                        ColorWidget(color: Colors.black),
                                        SizedBox(width: 20),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        FirstRow(text: 'Total'),
                                        SizedBox(width: 25),
                                        FirstRow(text: '-'),
                                        SizedBox(width: 20),
                                        FirstRow(text: '1'),
                                        SizedBox(width: 20),
                                        FirstRow(text: '+'),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total Payments',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
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
                                          foregroundColor:
                                              WidgetStatePropertyAll(
                                                Colors.white,
                                              ),
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                kPrimaryColor,
                                              ),
                                        ),

                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => CheckoutScreen(),
                                            ),
                                          );
                                        },
                                        child: Text('Checkout'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      );
                    },
                    child: Text('Buy Now'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      width: 30,
      height: 30,
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
