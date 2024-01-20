import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String title, backdropPath, posterPath;
  final int id;

  const Movie({
    super.key,
    required this.title,
    required this.backdropPath,
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
      child: SizedBox(
        width: 120,
        // height: 80,
        child: Column(
          children: [
            Container(
              width: 120,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500$backdropPath',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
