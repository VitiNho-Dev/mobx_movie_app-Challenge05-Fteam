import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;

  const ShimmerWidget({
    Key? key,
    this.height = 130,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
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
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: ListView.builder(
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
                      height: 20,
                      width: 70,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          flex: 9,
          child: Padding(
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
                  height: height,
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
          ),
        ),
      ],
    );
  }
}
