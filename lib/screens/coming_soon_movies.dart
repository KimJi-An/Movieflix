import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/movie_widget.dart';

class ComingSoonMovies extends StatelessWidget {
  ComingSoonMovies({super.key});

  final Future<List<MovieModel>> popularMovies =
      ApiService.getMovies("coming-soon");

  static const String baseUrl = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: popularMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(child: makeList(snapshot));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var comingSoonMovie = snapshot.data![index];

        return Movie(
          title: comingSoonMovie.title,
          backdropPath: comingSoonMovie.backdropPath,
          posterPath: comingSoonMovie.posterPath,
          id: comingSoonMovie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
