import 'package:dartz/dartz.dart';
import 'package:movies/common/data/api_client.dart';
import 'package:movies/common/data/error_to_failure_mixin.dart';
import 'package:movies/common/domain/either_failure_or.dart';

import '../../../../common/domain/entities/movie.dart';

abstract class MoviesRepository {
  EitherFailureOr<List<Movie>> getMovies();
}

class MoviesRepositoryImpl with ErrorToFailureMixin implements MoviesRepository {
  final ApiClient _apiClient;

  MoviesRepositoryImpl(this._apiClient);

  @override
  EitherFailureOr<List<Movie>> getMovies() => execute(() async {
    final response = await _apiClient.getMovies();
    return Right(
      response.results.map((e) => e.toDomain()).toList(), 
    );
  });
}