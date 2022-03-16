import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_movie_app/app/modules/home/domain/usecases/get_movies_usecase.dart';
import 'package:mobx_movie_app/app/modules/home/domain/usecases/get_genre_usecase.dart';
import 'package:mobx_movie_app/app/modules/home/external/datasources/genre_datasource_impl.dart';
import 'package:mobx_movie_app/app/modules/home/external/datasources/movie_datasource_impl.dart';
import 'package:mobx_movie_app/app/modules/home/infra/repositories/genre_repository_impl.dart';
import 'package:mobx_movie_app/app/modules/home/infra/repositories/movie_repository_impl.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/home_page.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/list_genres/list_genre_store.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/list_movies/list_movie_store.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/movie_details_page/movie_details_page.dart';
import 'package:uno/uno.dart';

import 'shared/services/http_client_uno.dart';

class AppModules extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => Uno()),
        Bind.factory((i) => MovieClientUno(i())),
        Bind.factory((i) => GetMovieUsecaseImpl(i())),
        Bind.factory((i) => GetGenreUsecaseImpl(i())),
        Bind.factory((i) => MovieDatasourceImpl(i())),
        Bind.factory((i) => GenreDatasourceImpl(i())),
        Bind.factory((i) => MovieRepositoryImpl(i())),
        Bind.factory((i) => GenreRepositoryImpl(i())),
        Bind.singleton((i) => ListMovieStore(i(), i())),
        Bind.singleton((i) => ListGenreStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/movieDetailPage',
          child: (context, args) => MovieDetailPage(
            detailMovie: args.data,
          ),
        ),
      ];
}
