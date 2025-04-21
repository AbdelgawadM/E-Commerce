import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_session/features/favourite_feature/items/empty_favourites_widget.dart';
import 'package:login_session/features/main_feature/builders/grid_builder.dart';
import 'package:login_session/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:login_session/cubits/favourites_cubit/favourites_states.dart';

class UpdatedFavoritesWidget extends StatelessWidget {
  const UpdatedFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesUpdated) {
          final favorites = state.favorites;
          if (favorites.isEmpty) {
            return const EmptyFavoritesWidget();
          }
          return GridBuilder(products: state.favorites);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
