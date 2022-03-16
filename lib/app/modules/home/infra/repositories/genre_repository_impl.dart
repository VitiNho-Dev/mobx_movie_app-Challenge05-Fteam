import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx_movie_app/app/modules/home/domain/repositories/genre_repository.dart';
import 'package:mobx_movie_app/app/modules/home/infra/datasources/genre_datasource.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreDatasource datasource;
  GenreRepositoryImpl(this.datasource);

  @override
  Future<Either<Failures, List<Genre>>> pickUpGenres() async {
    try {
      final result = await datasource.getGenresFromNetwork();
      return result;
    } on Failures catch (e) {
      return Left(
          GenreRepositoryFailure(message: 'Genre repository falhou $e'));
    }
  }
}
