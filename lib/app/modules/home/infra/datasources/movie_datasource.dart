import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';

abstract class MovieDatasource {
  Future<Either<Failures, List<Movie>>> getMoviesFromNetwork();
}
