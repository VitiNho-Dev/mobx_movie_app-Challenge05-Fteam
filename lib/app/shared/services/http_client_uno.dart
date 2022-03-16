import 'package:dartz/dartz.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/shared/services/http_iclient.dart';
import 'package:uno/uno.dart';

class MovieClientUno implements IClient {
  final Uno uno;

  MovieClientUno(this.uno);
  @override
  Future<Either<Failures, Response>> getNetwork(String url) async {
    try {
      final Response response = await uno.get(url);
      return Right(response);
    } on UnoError catch (e) {
      return Left(ClientFailures(message: 'Client falhou $e'));
    }
  }
}
