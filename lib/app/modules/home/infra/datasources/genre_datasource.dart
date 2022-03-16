import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';

abstract class GenreDatasource {
  Future<Either<Failures, List<Genre>>> getGenresFromNetwork();
}
