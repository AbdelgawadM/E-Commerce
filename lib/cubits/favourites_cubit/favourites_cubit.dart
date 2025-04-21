// cubits/favorites_cubit/favorites_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_session/cubits/favourites_cubit/favourites_states.dart';
import 'package:login_session/models/product_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  List<ProductModel> favoriteItems = [];

  void toggleFavorite(ProductModel product) {
    if (favoriteItems.contains(product)) {
      favoriteItems.remove(product);
    } else {
      favoriteItems.add(product);
    }

    emit(FavoritesUpdated(List.from(favoriteItems)));
  }

  bool isFavorite(ProductModel product) {
    return favoriteItems.contains(product);
  }
}
