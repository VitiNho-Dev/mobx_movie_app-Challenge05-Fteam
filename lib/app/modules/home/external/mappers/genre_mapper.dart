import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';

class GenreMapper {
  static Genre fromMap(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}
