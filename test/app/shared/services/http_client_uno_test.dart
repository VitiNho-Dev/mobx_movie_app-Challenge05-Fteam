import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/shared/services/http_client_uno.dart';
import 'package:uno/uno.dart';

class MockUno extends Mock implements Uno {}

void main() {
  final uno = MockUno();
  final movieClientUno = MovieClientUno(uno);
  final Response response = Response(
      headers: {},
      request: Request(
          uri: Uri(), method: 'GET', timeout: const Duration(), headers: {}),
      status: 200,
      data: '');

  test('Deve conectar na rede', () async {
    when(() => uno.get(any()))
        .thenAnswer((_) async => Future<Response>(() => response));
    final result = await movieClientUno.getNetwork('');
    expect(result.fold(id, id), isA<Response>());
  });

  test('Deve retornar um error', () async {
    when(() => uno.get(any())).thenThrow(const UnoError('Falhou'));
    final result = await movieClientUno.getNetwork('');
    expect(result.fold(id, id), isA<Failures>());
  });
}
