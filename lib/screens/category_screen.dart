import 'package:flutter/material.dart';
import 'package:login_session/components/product.dart';
import 'package:login_session/models/product_model.dart';
import 'package:login_session/screens/product_overview.dart';
import 'package:login_session/services/store_service.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.categorySlug});
  final String categorySlug;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Future<List<ProductModel>>? future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = StoreService().fetchProducts(widget.categorySlug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.categorySlug,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [InProductFutureBuilser(future: future)]),
      ),
    );
  }
}

class InProductFutureBuilser extends StatelessWidget {
  const InProductFutureBuilser({super.key, required this.future});

  final Future<List<ProductModel>>? future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.black));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No data available!'));
        }

        return Expanded(
          child: GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemBuilder:
                (context, index) => Product(
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
                  text: snapshot.data![index].title,
                  image: snapshot.data![index].images[0],
                  price: snapshot.data![index].price,
                ),
          ),
        );
      },
    );
  }
}
