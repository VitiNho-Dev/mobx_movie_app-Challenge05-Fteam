import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx_movie_app/app/modules/home/external/mappers/genre_mapper.dart';
import 'package:mobx_movie_app/app/modules/home/infra/datasources/genre_datasource.dart';
import 'package:mobx_movie_app/app/shared/services/http_iclient.dart';

class GenreDatasourceImpl implements GenreDatasource {
  final IClient client;

  GenreDatasourceImpl(this.client);

  @override
  Future<Either<Failures, List<Genre>>> getGenresFromNetwork() async {
    try {
      final response = await client.getNetwork(
          'http://api.themoviedb.org/3/genre/movie/list?api_key=432ad0a10dd3abc7225d168001167d34');
      return response.fold((l) {
        return Left(GenreDatasourceNoInternetConnection(
            message: 'Genre Datasource falhou $l'));
      }, (r) {
        final result = r.data['genres'] as List;
        final List<Genre> list = [];
        for (var item in result) {
          list.add(GenreMapper.fromMap(item));
        }
        return Right(list);
      });
    } on Failures catch (e) {
      return Left(GenreDatasourceNoInternetConnection(
          message: 'Genre Datasource falhou $e'));
    }
  }
}
