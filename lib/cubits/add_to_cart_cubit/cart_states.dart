import 'package:login_session/models/product_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<ProductModel> cartItems;

  CartUpdated(this.cartItems);
}
