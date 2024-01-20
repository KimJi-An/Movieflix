import 'package:flutter/material.dart';
import 'package:movieflix/screens/coming_soon_movies.dart';
import 'package:movieflix/screens/now_playing_movies.dart';
import 'package:movieflix/screens/popular_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const black = Colors.black;
  static const white = Colors.white;
  static const fontSize = 20.0;
  static const fontWeight800 = FontWeight.w800;
  static const fontWeight600 = FontWeight.w600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
              height: 50,
            ),
            const Text(
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
            // const SizedBox(
            //   height: 10,
            // ),
            const Text(
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
