import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/popular_movie_widget.dart';

class PopularMovies extends StatelessWidget {
  PopularMovies({super.key});

  final Future<List<MovieModel>> popularMovies =
      ApiService.getMovies("popular");

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
        var popularMovie = snapshot.data![index];

        return PopularMovie(
          posterPath: popularMovie.posterPath,
          id: popularMovie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
