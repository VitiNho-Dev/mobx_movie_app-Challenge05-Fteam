import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/modules/home/infra/datasources/genre_datasource.dart';
import 'package:mobx_movie_app/app/modules/home/infra/repositories/genre_repository_impl.dart';

class GenreDatasourceMock extends Mock implements GenreDatasource {}

class GenreMapperMock extends Mock implements Genre {}

void main() {
  final datasource = GenreDatasourceMock();
  final repository = GenreRepositoryImpl(datasource);
  final List<Genre> genreMapper = [GenreMapperMock()];

  test('Deve retornar um medelo dos Generos', () async {
    when(() => datasource.getGenresFromNetwork())
        .thenAnswer((_) async => Right(genreMapper));
    final result = await repository.pickUpGenres();
    expect(result.fold(id, id), isA<List<Genre>>());
  });

  test('Deve retornar um erro de repository', () async {
    when(() => datasource.getGenresFromNetwork())
        .thenAnswer((_) async => Left(GenreRepositoryFailure(message: '')));
    final result = await repository.pickUpGenres();
    expect(result.fold(id, id), isA<GenreRepositoryFailure>());
  });
}
