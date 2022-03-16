import 'package:mobx/mobx.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/usecases/get_genre_usecase.dart';
part 'list_genre_store.g.dart';

class ListGenreStore = _ListGenreStoreBase with _$ListGenreStore;

abstract class _ListGenreStoreBase with Store {
  final GetGenreUsecase genreUsecase;

  _ListGenreStoreBase(this.genreUsecase);

  @observable
  bool loading = false;

  @observable
  String error = '';

  @observable
  List<Genre> state = [];

  @action
  Future<void> getGenre() async {
    loading = true;
    await Future.delayed(const Duration(seconds: 5));
    final response = await genreUsecase();
    response.fold(
      (l) => error = l.message,
      (r) {
        state = [Genre(id: -1, name: 'All'), ...r];
      },
    );
    loading = false;
  }
}
