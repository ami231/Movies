import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:movies/features/home/presentation/widgets/movies_list_view.dart';

import '../../domain/cubit/favorites_cubit.dart';

class FavoritesPage extends StatefulWidget {
  static const String title = 'FavoritesPage';

  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favorites'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final favorites = state.favorites.movies;
          return MovieListView(movies: favorites, favorites: favorites,);
        }
      ),
      bottomNavigationBar: bottomNavBar(context: context, isHomePage: false),
    );
  }
}