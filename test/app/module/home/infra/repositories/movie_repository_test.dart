import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/modules/home/infra/datasources/movie_datasource.dart';
import 'package:mobx_movie_app/app/modules/home/infra/repositories/movie_repository_impl.dart';

class MovieDatasourceMock extends Mock implements MovieDatasource {}

class MovieMapperMock extends Mock implements Movie {}

void main() {
  final datasource = MovieDatasourceMock();
  final repository = MovieRepositoryImpl(datasource);
  final List<Movie> movieMapper = [MovieMapperMock()];

  test('Deve retornar uma lista de filmes', () async {
    when(() => datasource.getMoviesFromNetwork())
        .thenAnswer((_) async => Right(movieMapper));
    final result = await repository.getMovies();
    final value = result.fold(id, id);
    expect(value, isA<List<Movie>>());
  });

  test('Deve retornar um erro de repository', () async {
    when(() => datasource.getMoviesFromNetwork())
        .thenAnswer((_) async => Left(MovieRepositoryFailure(message: '')));
    final result = await repository.getMovies();
    final value = result.fold(id, id);
    expect(value, isA<MovieRepositoryFailure>());
  });
}
