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
                  vertical: 60,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
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
