import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:uno/uno.dart';

abstract class IClient {
  Future<Either<Failures, Response>> getNetwork(String url);
}
