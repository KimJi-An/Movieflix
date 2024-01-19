import 'package:flutter/material.dart';
import 'package:movieflix/screens/coming_soon_movies.dart';
import 'package:movieflix/screens/now_playing_movies.dart';
import 'package:movieflix/screens/popular_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final black = Colors.black;
  final white = Colors.white;
  final fontSize = 20.0;
  final fontWeight800 = FontWeight.w800;
  final fontWeight600 = FontWeight.w600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Movies',
              style: TextStyle(
                color: white,
                fontSize: fontSize,
                fontWeight: fontWeight800,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PopularMovies(),
            const SizedBox(
              height: 70,
            ),
            Text(
              'Now in Cinemas',
              style: TextStyle(
                color: white,
                fontSize: fontSize,
                fontWeight: fontWeight800,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            NowPlayingMovies(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Coming soon',
              style: TextStyle(
                color: white,
                fontSize: fontSize,
                fontWeight: fontWeight800,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ComingSoonMovies(),
          ],
        ),
      ),
    );
  }
}
