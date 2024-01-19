import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';

const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

class ApiService {
  static Future<List<MovieModel>> getMovies(String keyword) async {
    final url = Uri.parse('$baseUrl/$keyword');
    final response = await http.get(url);

    List<MovieModel> movieInstances = [];

    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)["results"];

      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(int id) async {
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
