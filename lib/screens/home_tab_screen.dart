import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_session/components/categories.dart';
import 'package:login_session/components/grid_product.dart';
import 'package:login_session/components/product.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 270,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find Your Product ',
                      hintStyle: TextStyle(color: Color(0xFFEB5425)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFEB5425),
                        size: 30,
                      ),
                      filled: true,
                      fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Icon(
                    color: Color(0xFFEB5425),
                    CupertinoIcons.bell_fill,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 221, 195),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image(image: AssetImage('assets/images/freed.png')),
            ),
            SizedBox(height: 25),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Categories(data: 'All'),
                  Categories(data: 'Category'),
                  Categories(data: 'Top'),
                  Categories(data: 'Recommended'),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 193,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Product(),
                separatorBuilder: (context, index) => SizedBox(width: 15),
                itemCount: 7,
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Newest Products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              children: [
                GridProduct(),
                GridProduct(),
                GridProduct(),
                GridProduct(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
