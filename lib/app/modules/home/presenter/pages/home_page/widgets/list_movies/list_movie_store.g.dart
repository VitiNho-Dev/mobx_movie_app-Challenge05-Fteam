// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListMovieStore on _ListMovieStore, Store {
  final _$stateAtom = Atom(name: '_ListMovieStore.state');

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ListMovieStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_ListMovieStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$getMovieAsyncAction = AsyncAction('_ListMovieStore.getMovie');

  @override
  Future<void> getMovie() {
    return _$getMovieAsyncAction.run(() => super.getMovie());
  }

  final _$getMovieFilteredAsyncAction =
      AsyncAction('_ListMovieStore.getMovieFiltered');

  @override
  Future<void> getMovieFiltered(int id) {
    return _$getMovieFilteredAsyncAction.run(() => super.getMovieFiltered(id));
  }

  final _$getMovieSearchAsyncAction =
      AsyncAction('_ListMovieStore.getMovieSearch');

  @override
  Future<void> getMovieSearch(String title) {
    return _$getMovieSearchAsyncAction.run(() => super.getMovieSearch(title));
  }

  @override
  String toString() {
    return '''
state: ${state},
loading: ${loading},
error: ${error}
    ''';
  }
}
