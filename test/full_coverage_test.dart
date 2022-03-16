// ignore_for_file: unused_import
import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:mobx_movie_app/app/modules/home/domain/repositories/genre_repository.dart';
import 'package:mobx_movie_app/app/modules/home/domain/repositories/movie_repository.dart';
import 'package:mobx_movie_app/app/modules/home/domain/usecases/get_genre_usecase.dart';
import 'package:mobx_movie_app/app/modules/home/domain/usecases/get_movies_usecase.dart';
import 'package:mobx_movie_app/app/modules/home/external/datasources/genre_datasource_impl.dart';
import 'package:mobx_movie_app/app/modules/home/external/datasources/movie_datasource_impl.dart';
import 'package:mobx_movie_app/app/modules/home/external/mappers/genre_mapper.dart';
import 'package:mobx_movie_app/app/modules/home/external/mappers/movie_mapper.dart';
import 'package:mobx_movie_app/app/modules/home/infra/datasources/genre_datasource.dart';
import 'package:mobx_movie_app/app/modules/home/infra/datasources/movie_datasource.dart';
import 'package:mobx_movie_app/app/modules/home/infra/repositories/genre_repository_impl.dart';
import 'package:mobx_movie_app/app/modules/home/infra/repositories/movie_repository_impl.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/controllers/change_color.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_app_bar.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_card_movie.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/movie_details_page/widgets/custom_app_bar.dart';
import 'package:mobx_movie_app/app/shared/services/http_client_uno.dart';
import 'package:mobx_movie_app/main.dart';

void main() {}
