import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_session/cubits/add_to_cart_cubit/cart_states.dart';
import 'package:login_session/models/product_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<ProductModel> cartItems = [];

  // دالة لإضافة المنتج فقط إذا كان غير موجود مسبقًا
  bool addToCart(ProductModel product) {
    final alreadyInCart = cartItems.any((item) => item.id == product.id);
    if (!alreadyInCart) {
      cartItems.add(product);
      emit(CartUpdated(cartItems));
      return true; // تم إضافة منتج جديد
    } else {
      return false; // المنتج موجود بالفعل
    }
  }

  // دالة لإزالة المنتج
  void removeFromCart(ProductModel product) {
    cartItems.remove(product);

    if (cartItems.isEmpty) {
      emit(CartInitial());
    } else {
      emit(CartUpdated(cartItems));
    }
  }

  double getTotalPrice() {
    return cartItems.fold(0.0, (sum, item) => sum + item.price);
  }
}
