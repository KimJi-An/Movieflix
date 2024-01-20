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
  static const titleFontSize = 40.0;
  static const infoFontSize = 13.0;
  static const overviewFontSize = 17.0;
  static const fontWeight600 = FontWeight.w600;
  static const fontWeight800 = FontWeight.w800;

  late Future<MovieDetailModel> movie;

  static String minToHour(int minutes) {
    if (minutes < 60) {
      return "${minutes}min";
    } else {
      int hour = minutes ~/ 60;
      int min = minutes % 60;

      return "${hour}h ${min}min";
    }
  }

  static String ratings(bool adult) {
    if (adult) {
      return "19";
    } else {
      return "15+";
    }
  }

  static String printGenres(List<dynamic> genres) {
    String genre = genres[0]['name'];

    for (int i = 1; i < genres.length; i++) {
      genre += ", ${genres[i]['name']}";
    }

    return genre;
  }

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
              var movie = snapshot.data;

              return Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 130,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie!.title,
                          style: const TextStyle(
                            color: white,
                            fontSize: titleFontSize,
                            fontWeight: fontWeight800,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${movie.releaseDate} | ${minToHour(movie.runtime)} | ${ratings(movie.adult)}",
                          style: const TextStyle(
                            color: white,
                            fontSize: infoFontSize,
                            fontWeight: fontWeight600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          printGenres(movie.genres),
                          style: const TextStyle(
                            color: white,
                            fontSize: infoFontSize,
                            fontWeight: fontWeight600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          movie.overview,
                          style: const TextStyle(
                            color: white,
                            fontSize: overviewFontSize,
                            fontWeight: fontWeight600,
                            letterSpacing: 1.3,
                            height: 1.5,
                          ),
                        ),
                      ],
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
