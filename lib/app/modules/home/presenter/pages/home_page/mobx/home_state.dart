import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';

class HomeState {
  final List<Movie> listMovies;
  final List<Movie> listMoviesFiltered;
  final List<Genre> listGenre;

  const HomeState({
    this.listMovies = const [],
    this.listMoviesFiltered = const [],
    this.listGenre = const [],
  });

  HomeState copyWith({
    List<Movie>? listMovies,
    List<Movie>? listMoviesFiltered,
    List<Genre>? listGenre,
  }) {
    return HomeState(
      listMovies: listMovies ?? this.listMovies,
      listMoviesFiltered: listMoviesFiltered ?? this.listMoviesFiltered,
      listGenre: listGenre ?? this.listGenre,
    );
  }
}
