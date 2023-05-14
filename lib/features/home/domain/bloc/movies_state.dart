import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../../common/domain/entities/movie.dart';

@immutable
abstract class MoviesState extends Equatable {
  
}

class MoviesInitial extends MoviesState {
  MoviesInitial() : super();

  @override
  List<Object?> get props => [];
}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;
  MoviesLoaded(this.movies);
  @override
  List<Object?> get props => [movies];
}

class MoviesLoading extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MoviesError extends MoviesState {
  final String error;
  MoviesError(this.error);
  @override
  List<Object?> get props => [error];
}