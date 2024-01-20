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
        padding: const EdgeInsets.only(top: 80, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PopularMovies(),
            NowPlayingMovies(),
            ComingSoonMovies(),
          ],
        ),
      ),
    );
  }
}
