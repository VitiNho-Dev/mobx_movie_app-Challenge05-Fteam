import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomMovieShimmerWidget extends StatefulWidget {
  const CustomMovieShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomMovieShimmerWidget> createState() =>
      _CustomMovieShimmerWidgetState();
}

class _CustomMovieShimmerWidgetState extends State<CustomMovieShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        top: 8.0,
        right: 12.0,
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 130,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xff12162d),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Shimmer.fromColors(
              baseColor: const Color(0xff12162d),
              highlightColor: Colors.grey.shade300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 130,
                        width: 86,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 12),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width * 0.5,
                              child: Container(
                                height: 20,
                                width: 130,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
