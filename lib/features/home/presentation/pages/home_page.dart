import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/bottom_nav_bar/bottom_nav_bar.dart';

import '../../../favorites/domain/cubit/favorites_cubit.dart';
import '../../domain/bloc/movies_bloc.dart';
import '../../domain/bloc/movies_state.dart';
import '../widgets/movies_list_view.dart';

class HomePage extends StatefulWidget {
  static const String title = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final favorites = state.favorites.movies;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Popular movies'),
            automaticallyImplyLeading: false,
          ),
          body: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
            if (state is MoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MoviesError) {
              return Center(child: Text(state.error),);
            }
            if (state is MoviesLoaded) {
              return MovieListView(movies: state.movies, favorites: favorites,);
            }
            return Container();
          }),
          bottomNavigationBar: bottomNavBar(context: context, isHomePage: true),
        );
      }
    );
  }
}
