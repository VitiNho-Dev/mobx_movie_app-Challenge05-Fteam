import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/modules/home/domain/repositories/genre_repository.dart';

abstract class GetGenreUsecase {
  Future<Either<Failures, List<Genre>>> call();
}

class GetGenreUsecaseImpl implements GetGenreUsecase {
  final GenreRepository repository;

  GetGenreUsecaseImpl(this.repository);

  @override
  Future<Either<Failures, List<Genre>>> call() async {
    try {
      final result = await repository.pickUpGenres();
      return result;
    } on Failures catch (e) {
      return Left(GenreUsecaseFailure(message: 'Genre usecase falhou $e'));
    }
  }
}
