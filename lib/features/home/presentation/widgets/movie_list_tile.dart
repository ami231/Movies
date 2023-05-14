import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/data/constants/app_constants.dart';
import '../../../../common/domain/entities/movie.dart';
import '../../../favorites/domain/cubit/favorites_cubit.dart';
import '../pages/movie_detail_page.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({
    super.key,
    required this.movie,
    required this.isFavorite,
    required this.favorites,
  });

  final Movie movie;
  final bool isFavorite;
  final List<Movie> favorites;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.purpleAccent.shade100,
      leading: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Image.network("${AppConstants.posterUrl}${movie.posterPath!}"),
      ),
      trailing: IconButton(
        onPressed: () => favoritesAction(context, movie, favorites),
        icon: Icon(
          isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          color: Colors.purpleAccent,
        ),
      ),
      title: Text(movie.title!),
      subtitle: Text(movie.releaseDate.toString()),
      onTap: () {
        Navigator.pushNamed(context, MovieDetailPage.title, arguments: movie);
      },
    );
  }
}

void favoritesAction(context, Movie movie, List<Movie> favorites) {
  if (favorites.contains(movie)) {
    BlocProvider.of<FavoritesCubit>(context).removeFromFavorites(movie.id!);
  } else {
    BlocProvider.of<FavoritesCubit>(context).addToFavorites(movie);
  }
}
