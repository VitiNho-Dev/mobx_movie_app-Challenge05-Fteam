import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx_movie_app/app/modules/home/domain/repositories/movie_repository.dart';
import 'package:mobx_movie_app/app/modules/home/infra/datasources/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<Either<Failures, List<Movie>>> getMovies() async {
    try {
      final result = await datasource.getMoviesFromNetwork();
      return result;
    } on Failures catch (e) {
      return Left(
          MovieRepositoryFailure(message: 'Movie repository falhou $e'));
    }
  }
}
