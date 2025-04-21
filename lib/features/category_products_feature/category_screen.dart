import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_session/features/main_feature/builders/product_cubit_builder.dart';
import 'package:login_session/cubits/product_cubit/product_cubit.dart';
import 'package:login_session/services/store_service.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categorySlug});
  final String categorySlug;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              ProductCubit(storeService: StoreService(), category: categorySlug)
                ..fetchProducts(), // أول ما يتبني يبدأ يجلب المنتجات
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            categorySlug,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [ProductCubitBuilder()],
          ),
        ),
      ),
    );
  }
}
