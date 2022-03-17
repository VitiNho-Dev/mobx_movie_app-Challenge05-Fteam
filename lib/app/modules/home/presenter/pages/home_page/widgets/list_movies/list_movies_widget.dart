import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_card_movie.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/list_movies/custom_movie_shimmer_widget.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/list_movies/list_movie_store.dart';

class ListMoviesWidget extends StatefulWidget {
  final Function(Movie movie) onTap;
  const ListMoviesWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  State<ListMoviesWidget> createState() => _ListMoviesWidgetState();
}

class _ListMoviesWidgetState extends State<ListMoviesWidget> {
  final listMovieStore = Modular.get<ListMovieStore>();

  @override
  void initState() {
    super.initState();
    listMovieStore.getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        top: 8.0,
        right: 12.0,
      ),
      child: Observer(
        builder: (context) {
          if (listMovieStore.loading) {
            return const CustomMovieShimmerWidget();
          }
          if (listMovieStore.error.isNotEmpty) {
            return Center(
              child: Text(listMovieStore.error),
            );
          }
          return ListView.builder(
            itemCount: listMovieStore.state.listMoviesFiltered.length,
            itemBuilder: (context, index) {
              Movie movie = listMovieStore.state.listMoviesFiltered[index];
              return CustomCardMovie(
                tag: 'item-${movie.id}',
                movie: movie,
                image: movie.posterPath,
                name: movie.title,
                vote: movie.voteAverage,
                onTap: () {
                  widget.onTap(movie);
                },
              );
            },
          );
        },
      ),
    );
  }
}
