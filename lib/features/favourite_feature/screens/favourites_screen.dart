import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_session/features/favourite_feature/items/empty_favourites_widget.dart';
import 'package:login_session/features/favourite_feature/items/updated_favourite_widget.dart';
import 'package:login_session/cubits/favourites_cubit/favourites_cubit.dart';
import 'package:login_session/cubits/favourites_cubit/favourites_states.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Favourites',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesUpdated) {
              return UpdatedFavoritesWidget();
            } else if (state is FavoritesInitial) {
              return EmptyFavoritesWidget();
            } else {
              return Center(child: Text('error'));
            }
          },
        ),
      ),
    );
  }
}
