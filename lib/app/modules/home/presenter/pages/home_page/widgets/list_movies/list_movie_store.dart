import 'package:mobx/mobx.dart';
import 'package:mobx_movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:mobx_movie_app/app/modules/home/domain/usecases/get_genre_usecase.dart';
import 'package:mobx_movie_app/app/modules/home/domain/usecases/get_movies_usecase.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/mobx/home_state.dart';

part 'list_movie_store.g.dart';

class ListMovieStore = _ListMovieStore with _$ListMovieStore;

abstract class _ListMovieStore with Store {
  final GetMovieUsecase movieUsecase;
  final GetGenreUsecase genreUsecase;

  _ListMovieStore(this.movieUsecase, this.genreUsecase);

  @observable
  HomeState state = const HomeState();

  @observable
  bool loading = false;

  @observable
  String error = '';

  @action
  Future<void> getMovie() async {
    loading = true;
    await Future.delayed(const Duration(seconds: 5));
    final response = await movieUsecase();
    response.fold(
      (l) => error = l.message,
      (r) {
        state = state.copyWith(listMovies: r, listMoviesFiltered: r);
      },
    );
    loading = false;
  }

  @action
  Future<void> getMovieFiltered(int id) async {
    loading = true;
    try {
      if (id == -1) {
        state = state.copyWith(
          listMoviesFiltered: state.listMovies,
        );

        loading = false;
        return;
      }
      final listFiltered = state.listMovies.where(
        (element) => element.genres.contains(id),
      );
      state = state.copyWith(
        listMoviesFiltered: listFiltered.toList(),
      );
    } on Failures catch (e) {
      error = e.message;
    }
    loading = false;
  }

  @action
  Future<void> getMovieSearch(String title) async {
    loading = true;
    try {
      if (title == '') {
        state = state.copyWith(
          listMoviesFiltered: state.listMovies,
        );
        loading = false;
        return;
      }
      final listFiltered = state.listMovies.where(
        (element) => element.title.contains(title),
      );
      state = state.copyWith(
        listMoviesFiltered: listFiltered.toList(),
      );
    } on Failures catch (e) {
      error = e.message;
    }
    loading = false;
  }
}
