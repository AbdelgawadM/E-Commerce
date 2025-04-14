import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_session/components/categories.dart';
import 'package:login_session/components/product.dart';
import 'package:login_session/consts.dart';
import 'package:login_session/models/category_model';
import 'package:login_session/models/product_model.dart';
import 'package:login_session/screens/category_screen.dart';
import 'package:login_session/screens/product_overview.dart';
import 'package:login_session/services/store_service.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  Future<List<CategoryModel>>? categoryfuture;
  Future<List<ProductModel>>? nwestfuture;
  Future<List<ProductModel>>? bestSellerfuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryfuture = StoreService().fetchCategories();
    nwestfuture = StoreService().fetchProducts('clothes');
    bestSellerfuture = StoreService().fetchProducts('furniture');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 50, width: 270, child: SearchTextField()),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Icon(color: kPrimaryColor, CupertinoIcons.bell_fill),
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
          SizedBox(height: 15),

          CategoryFutureBuilder(categoryfuture: categoryfuture),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Newest Products',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(height: 20),
          NewstFutureBuilder(nwestfuture: nwestfuture),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Best Sellers',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(height: 20),
          NewstFutureBuilder(nwestfuture: bestSellerfuture),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class NewstFutureBuilder extends StatelessWidget {
  const NewstFutureBuilder({super.key, required this.nwestfuture});

  final Future<List<ProductModel>>? nwestfuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: nwestfuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.black));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No data available!'));
        }

        return SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) => Product(
                  text: snapshot.data![index].title,
                  image: snapshot.data![index].images[0],
                  price: snapshot.data![index].price,
                  ontap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => ProductOverview(
                              sampleImages: snapshot.data![index].images,
                              productName: snapshot.data![index].title,
                              description: snapshot.data![index].description,
                              price: snapshot.data![index].price,
                            ),
                      ),
                    );
                  },
                ),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: snapshot.data!.length,
          ),
        );
      },
    );
  }
}

class CategoryFutureBuilder extends StatelessWidget {
  const CategoryFutureBuilder({super.key, required this.categoryfuture});

  final Future<List<CategoryModel>>? categoryfuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoryfuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.black));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No data available!'));
        }

        return SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) => Categories(
                  image: snapshot.data![index].image,
                  onTab: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => CategoryScreen(
                              categorySlug: snapshot.data![index].slug,
                            ),
                      ),
                    );
                  },
                  data: snapshot.data![index].slug,
                ),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: snapshot.data!.length,
          ),
        );
      },
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Find Your Product ',
        hintStyle: TextStyle(color: kPrimaryColor),
        prefixIcon: Icon(Icons.search, color: kPrimaryColor, size: 30),
        filled: true,
        fillColor: Colors.black12,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
