import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';

class MovieMapper {
  static Movie fromMap(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: json['vote_average'].toDouble() ?? 0.0,
      genres: List<int>.from((json['genre_ids'] ?? []).map((x) => x)),
    );
  }
}
