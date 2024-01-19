import 'dart:convert';
import 'package:http/http.dart' as http;
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
}
