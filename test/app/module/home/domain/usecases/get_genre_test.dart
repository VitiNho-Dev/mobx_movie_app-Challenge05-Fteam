import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/modules/home/domain/repositories/genre_repository.dart';
import 'package:mobx_movie_app/app/modules/home/domain/usecases/get_genre_usecase.dart';

class RepositoryMock extends Mock implements GenreRepository {}

void main() {
  final repository = RepositoryMock();
  final datasource = GetGenreUsecaseImpl(repository);

  final genre = [
    Genre(
      id: 10,
      name: 'Ação',
    ),
  ];

  test('Deve retornar uma lista de Generos de Filmes', () async {
    when(() => repository.pickUpGenres())
        .thenAnswer((invocation) async => Right(genre));
    final result = await datasource.call();
    expect(result.fold(id, id), isA<List<Genre>>());
  });

  test('Deve retornar um erro de usecase', () async {
    when(() => repository.pickUpGenres()).thenAnswer(
        (invocation) async => Left(GenreUsecaseFailure(message: '')));
    final result = await datasource.call();
    expect(result.fold(id, id), isA<GenreUsecaseFailure>());
  });
}
