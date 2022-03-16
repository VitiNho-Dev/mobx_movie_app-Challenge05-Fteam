import 'package:dartz/dartz.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/modules/home/domain/repositories/movie_repository.dart';

abstract class GetMovieUsecase {
  Future<Either<Failures, List<Movie>>> call();
}

class GetMovieUsecaseImpl implements GetMovieUsecase {
  final MovieRepository repository;

  GetMovieUsecaseImpl(this.repository);

  @override
  Future<Either<Failures, List<Movie>>> call() async {
    try {
      final result = await repository.getMovies();
      return result;
    } on Failures catch (e) {
      return Left(MovieUsecaseFailure(message: 'Movie usecase falhou $e'));
    }
  }
}
