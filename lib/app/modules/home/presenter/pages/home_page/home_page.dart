import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_app_bar.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/list_genres/list_genre_widget.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/list_movies/list_movie_store.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/list_movies/list_movies_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listMovieStore = Modular.get<ListMovieStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e2440),
      appBar: CustomAppBar(
        onChanged: (value) {
          listMovieStore.getMovieSearch(value);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListGenreWidget(
            onSelect: (selectGenre) {
              listMovieStore.getMovieFiltered(selectGenre.id);
            },
          ),
          ListMoviesWidget(
            onTap: (movie) {
              Modular.to.pushNamed('/movieDetailPage', arguments: movie);
            },
          ),
        ],
      ),
    );
  }
}
