import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_session/cubits/add_to_cart_cubit/cart_cubit.dart';
import 'package:login_session/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:login_session/cubits/product_cubit/product_cubit.dart';
import 'package:login_session/features/main_feature/screens/home_screen.dart';
import 'package:login_session/services/store_service.dart';

Future<void> main() async {
  runApp(
    DevicePreview(
      enabled: true, // Set to false to disable it in production
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(create: (_) => CartCubit()),
        BlocProvider<FavoritesCubit>(create: (_) => FavoritesCubit()),
        BlocProvider<ProductCubit>(
          create:
              (_) => ProductCubit(
                storeService: StoreService(),
                category: 'furniture',
              ),
        ),
        // تقدر تضيف أكتر هنا لو حبيت
      ],
      child: MaterialApp(
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
