import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/domain/entities/favorites.dart';
import '../../../../common/domain/entities/movie.dart';

class FavoritesState {
  Favorites favorites = Favorites([]);
  FavoritesState({required this.favorites});
}

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState(favorites: Favorites([])));

  void addToFavorites(Movie movie) {
    final favoriteMovies = state.favorites.movies;
    favoriteMovies.add(movie);
    emit(FavoritesState(favorites: Favorites(favoriteMovies)));
  }

  void removeFromFavorites(int id) {
    final favoriteMovies = state.favorites.movies;
    favoriteMovies.removeWhere((element) => element.id == id);
    emit(FavoritesState(favorites: Favorites(favoriteMovies)));
  }
}