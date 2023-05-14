import 'package:flutter/material.dart';
import 'package:movies/common/domain/entities/movie.dart';
import 'package:movies/features/home/presentation/widgets/movie_list_tile.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
    required this.movies,
    required this.favorites,
  });

  final List<Movie> movies;
  final List<Movie> favorites;

  @override
  Widget build(BuildContext context) {
    return movies.isEmpty
        ? const Center(
            child: Text('No data'),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              thickness: 1.5,
              color: Colors.black,
            ),
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              final Movie movie = movies[index];
              return MovieListTile(
                movie: movie,
                isFavorite: isFavorite(movie, favorites),
                favorites: favorites,
              );
            },
          );
  }
}

bool isFavorite(Movie movie, List<Movie> favorites) {
  return favorites.contains(movie);
}
