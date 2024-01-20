import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class PopularMovie extends StatelessWidget {
  final String posterPath;
  final int id;

  const PopularMovie({
    super.key,
    required this.posterPath,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              posterPath: posterPath,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 120,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500$posterPath',
            ),
          ),
        ],
      ),
    );
  }
}
