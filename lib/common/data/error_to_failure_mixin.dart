import 'package:dartz/dartz.dart';
import '../domain/either_failure_or.dart';
import '../domain/entities/failure.dart';

mixin ErrorToFailureMixin {
  EitherFailureOr<T> execute<T>(
    EitherFailureOr<T> Function() function, {
      Failure? failure,
      EitherFailureOr<T> Function(Object err) ? onError,
    }) async {
      try {
        return await function();
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
        if (onError != null) {
          return onError(e);
        }
        return const Left(Failure.serverError());
      }
  }
}