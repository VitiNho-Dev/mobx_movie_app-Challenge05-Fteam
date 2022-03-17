import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_genre_widget.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/list_genres/custom_genre_shimmer_widget.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/home_page/widgets/list_genres/list_genre_store.dart';

class ListGenreWidget extends StatefulWidget {
  final Function(Genre selectGenre) onSelect;
  const ListGenreWidget({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<ListGenreWidget> createState() => _ListGenreWidgetState();
}

class _ListGenreWidgetState extends State<ListGenreWidget> {
  final listGenreStore = Modular.get<ListGenreStore>();
  int indexSelected = 0;

  @override
  void initState() {
    super.initState();
    listGenreStore.getGenre();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            'Categories',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Observer(
              builder: (context) {
                if (listGenreStore.loading) {
                  return const CustomGenreShimmerWidget();
                }
                if (listGenreStore.error.isNotEmpty) {
                  return Center(
                    child: Text(listGenreStore.error),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listGenreStore.state.length,
                  itemBuilder: (context, index) {
                    var genre = listGenreStore.state[index];
                    return CustomGenre(
                      name: genre.name,
                      isActive: indexSelected == index,
                      onTap: () {
                        widget.onSelect(genre);
                        setState(() {
                          indexSelected = index;
                        });
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
