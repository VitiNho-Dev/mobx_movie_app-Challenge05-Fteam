import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/modules/home/external/datasources/movie_datasource_impl.dart';
import 'package:mobx_movie_app/app/shared/services/http_iclient.dart';
import 'package:uno/uno.dart';

import '../../../../../utils/result_movie.dart';

class UnoClientMock extends Mock implements IClient {}

void main() {
  final client = UnoClientMock();
  final datasource = MovieDatasourceImpl(client);

  test('Deve conectar a API e retornar a lista de filmes', () async {
    when(() => client.getNetwork(any())).thenAnswer((_) async => Right(
          Response(
              headers: {},
              request: Request(
                  uri: Uri(),
                  method: 'GET',
                  timeout: const Duration(),
                  headers: {}),
              status: 200,
              data: resultMovies),
        ));
    final result = await datasource.getMoviesFromNetwork();
    expect(result.fold(id, id), isA<List<Movie>>());
  });

  test('Deve retornar uma falha de conexão', () async {
    when(() => client.getNetwork(any())).thenAnswer((_) async =>
        Left(MovieDatasourceNoInternetConnection(message: 'falhou')));
    final result = await datasource.getMoviesFromNetwork();
    expect(result.fold(id, id), isA<MovieDatasourceNoInternetConnection>());
  });
}
