import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomGenreShimmerWidget extends StatefulWidget {
  const CustomGenreShimmerWidget({Key? key}) : super(key: key);

  @override
  State<CustomGenreShimmerWidget> createState() =>
      _CustomGenreShimmerWidgetState();
}

class _CustomGenreShimmerWidgetState extends State<CustomGenreShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          width: 100,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff12162d),
          ),
          child: Shimmer.fromColors(
            baseColor: const Color(0xff12162d),
            highlightColor: Colors.grey.shade300,
            child: Container(
              height: 18,
              width: 70,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
