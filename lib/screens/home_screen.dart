import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: popularMovies,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Text(
                    "Popular Movies",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    itemBuilder: (context, index) {
                      var movie = snapshot.data![index];
                      return Movie(
                        title: movie.title,
                        poster: movie.poster,
                        id: movie.id,
                      );
                    },
                    separatorBuilder: (context, index) => 
                      const SizedBox(
                        width: 20,
                      ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}