import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/repositories/movies_repository.dart';
import 'package:movies/features/home/domain/bloc/movies_event.dart';
import 'package:movies/features/home/domain/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesBloc(this._moviesRepository) : super(MoviesLoading()) {
    on <LoadMoviesEvent>((event, emit) async {
      emit(MoviesLoading());
      final result = await _moviesRepository.getMovies();
      result.fold(
        (failure) {
          emit(MoviesError(failure.toString()));
        },
        (movies) {
          emit(MoviesLoaded(movies));
        },
      );
    });
  }
}
