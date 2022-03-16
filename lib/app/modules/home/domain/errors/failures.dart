abstract class Failures implements Exception {
  final String message;

  Failures({required this.message});
}

class MovieUsecaseFailure extends Failures {
  MovieUsecaseFailure({required String message}) : super(message: message);
}

class GenreUsecaseFailure extends Failures {
  GenreUsecaseFailure({required String message}) : super(message: message);
}

class MovieRepositoryFailure extends Failures {
  MovieRepositoryFailure({required String message}) : super(message: message);
}

class GenreRepositoryFailure extends Failures {
  GenreRepositoryFailure({required String message}) : super(message: message);
}

class MovieDatasourceNoInternetConnection extends Failures {
  MovieDatasourceNoInternetConnection({required String message})
      : super(message: message);
}

class GenreDatasourceNoInternetConnection extends Failures {
  GenreDatasourceNoInternetConnection({required String message})
      : super(message: message);
}

class ClientFailures extends Failures {
  ClientFailures({required String message}) : super(message: message);
}
