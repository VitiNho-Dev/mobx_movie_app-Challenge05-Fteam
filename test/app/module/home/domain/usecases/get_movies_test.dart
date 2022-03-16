import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/modules/home/domain/repositories/movie_repository.dart';
import 'package:mobx_movie_app/app/modules/home/domain/usecases/get_movies_usecase.dart';

class RepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = RepositoryMock();
  final usecase = GetMovieUsecaseImpl(repository);

  final movie = [
    Movie(
      title: 'Fight Club',
      voteAverage: 61.467,
      posterPath: '',
      backdropPath: '',
      overview: '',
      releaseDate: '',
      genres: [],
      id: 0,
    ),
  ];

  test('Deve trazer uma lista filme', () async {
    when(() => repository.getMovies()).thenAnswer((_) async => Right(movie));
    final result = await usecase();
    expect(result.fold(id, id), isA<List<Movie>>());
  });

  test('Deve retornar um erro de usecase', () async {
    when(() => repository.getMovies())
        .thenAnswer((_) async => Left(MovieUsecaseFailure(message: '')));
    final result = await usecase();
    expect(result.fold(id, id), isA<MovieUsecaseFailure>());
  });
}
