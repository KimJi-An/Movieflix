import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String? backdropPath;
  final String posterPath;
  final int id;

  const DetailScreen({
    super.key,
    this.backdropPath,
    required this.posterPath,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static const black = Colors.black;
  static const white = Colors.white;
  static const titleFontSize = 25.0;
  static const infoFontSize = 13.0;
  static const overviewFontSize = 17.0;
  static const fontWeight600 = FontWeight.w600;
  static const fontWeight800 = FontWeight.w800;

  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w500/${widget.posterPath}'),
          colorFilter:
              ColorFilter.mode(black.withOpacity(0.5), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: movie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 18,
                        color: white,
                      ),
                      label: const Text(
                        'Back to list',
                        style: TextStyle(
                          color: white,
                          fontSize: overviewFontSize,
                        ),
                      ),
                    ),
                    Text(
                      snapshot.data!.title,
                      style: const TextStyle(color: white),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
