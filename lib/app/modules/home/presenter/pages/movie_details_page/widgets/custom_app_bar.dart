import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_movie_app/app/modules/home/presenter/pages/movie_details_page/widgets/custom_cached_image_widget.dart';

class CustomAppBarDetailsPage extends StatelessWidget
    implements PreferredSizeWidget {
  final String urlImage;
  final String tag;

  const CustomAppBarDetailsPage({
    Key? key,
    required this.urlImage,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.5,
          child: Hero(
            tag: tag,
            child: CachedImageWidget(urlImage: urlImage),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              tileMode: TileMode.decal,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xff1e2440),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: IconButton(
            onPressed: () {
              Modular.to.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 160);
}
