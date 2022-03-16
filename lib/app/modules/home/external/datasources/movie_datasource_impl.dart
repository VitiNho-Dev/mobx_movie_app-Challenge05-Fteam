import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx_movie_app/app/modules/home/infra/datasources/movie_datasource.dart';
import 'package:mobx_movie_app/app/modules/home/external/mappers/movie_mapper.dart';
import 'package:mobx_movie_app/app/shared/services/http_iclient.dart';

class MovieDatasourceImpl implements MovieDatasource {
  final IClient client;

  MovieDatasourceImpl(this.client);

  @override
  Future<Either<Failures, List<Movie>>> getMoviesFromNetwork() async {
    try {
      final response = await client.getNetwork(
          'http://api.themoviedb.org/3/movie/popular?api_key=432ad0a10dd3abc7225d168001167d34');
      return response.fold((l) {
        return Left(MovieDatasourceNoInternetConnection(
            message: 'Movie Datasource falhou $l'));
      }, (r) {
        final results = r.data['results'] as List;
        final List<Movie> list = [];
        for (final item in results) {
          list.add(MovieMapper.fromMap(item));
        }
        return Right(list);
      });
    } on Failures catch (e) {
      return Left(MovieDatasourceNoInternetConnection(
          message: 'Movie Datasource falhou $e'));
    }
  }
}
