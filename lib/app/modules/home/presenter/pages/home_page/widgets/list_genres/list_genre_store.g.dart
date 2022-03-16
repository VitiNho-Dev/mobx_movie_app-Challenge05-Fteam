// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_genre_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListGenreStore on _ListGenreStoreBase, Store {
  final _$loadingAtom = Atom(name: '_ListGenreStoreBase.loading');

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

  final _$errorAtom = Atom(name: '_ListGenreStoreBase.error');

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

  final _$stateAtom = Atom(name: '_ListGenreStoreBase.state');

  @override
  List<Genre> get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(List<Genre> value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$getGenreAsyncAction = AsyncAction('_ListGenreStoreBase.getGenre');

  @override
  Future<void> getGenre() {
    return _$getGenreAsyncAction.run(() => super.getGenre());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
state: ${state}
    ''';
  }
}
